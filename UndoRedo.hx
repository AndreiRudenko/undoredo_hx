package ;


class UndoRedo {


	public var capacity(default, null):Int;
	public var length(default, null):Int;

	var head:Command;
	var tail:Command;
	var command:Command;

	var undo_level:Int;


	public function new(_capacity:Int) {

		if(_capacity < 2) {
			throw('capacity must be more than 1');
		}

		length = 0;
		undo_level = 0;
		capacity = _capacity;

	}

	public function add(cmd:Command) {

		if(length < capacity) {

			if(undo_level == 0) {
				command = tail;
			} else {
				tail = command;
			}

			if (tail != null) {
				tail.next = cmd;
				cmd.prev = tail;
			} else {
				head = cmd;
			}

			tail = cmd;
			command = cmd;

			length -= undo_level;
			length++;
			undo_level = 0;

		} else {

			head = head.next;

			command.next = cmd;
			cmd.prev = command;
			tail = cmd;
			command = cmd;

		}
		
	}

	public function undo() {

		if(command == null && undo_level == 0) {
			command = tail;
		}

		if(command != null) {
			command.cancel();
			command = command.prev;
			undo_level++;
		}

	}

	public function redo() {

		if(command != null) {
			command = command.next;
		} else if(undo_level == length) {
			command = head;
		}

		if(command != null) {
			command.execute();
			undo_level--;
		}

	}

	public function empty() {

		length = 0;
		undo_level = 0;

		head = null;
		tail = null;
		command = null;

	}

	public function toString() {

		var str:String = '\n';

		var i:Int = 0;
		var node = head;
		while(node != null) {
			str += '$i: ${node.name}';

			if(node == command) {
				str += ' <-';
			}

			i++;
			node = node.next;

			if(node != null) {
				str += '\n';
			}

		}

		return str;
		
	}


}
