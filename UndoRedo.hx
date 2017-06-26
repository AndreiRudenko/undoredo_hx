package ;


class UndoRedo {


	public var capacity(default, null):Int;
	public var length(get, never):Int;

	var undo_stack:Dll<Command>;
	var redo_stack:Dll<Command>;


	public function new(_capacity:Int) {

		capacity = _capacity;

		undo_stack = new Dll();
		redo_stack = new Dll();

	}

	public function add(cmd:Command) {

		if(length >= capacity) {
			undo_stack.rem_last();
		}

		undo_stack.add_first(cmd);
		redo_stack.clear();
		cmd.execute();

	}

	public function undo(_levels:Int = 1) {

		for (_ in 0..._levels) {
			if(undo_stack.length != 0) {
				var cmd:Command = undo_stack.rem_first();
				cmd.cancel();
				redo_stack.add_first(cmd);
			}
		}

	}

	public function redo(_levels:Int = 1) {

		for (_ in 0..._levels) {
			if(redo_stack.length != 0) {
				var cmd:Command = redo_stack.rem_first();
				cmd.execute();
				undo_stack.add_first(cmd);
			}
		}

	}

	public function clear() {

		undo_stack.clear();
		redo_stack.clear();

	}

	public function toString() {

		var us = undo_stack.toArray();
		var rs = redo_stack.toArray();

		var str:String = '\n';

		str += 'undo:\n';

		for (i in 0...us.length) {
			var n = us[i];
			str += '$i: ${n.name}\n';
		}

		str += 'redo:\n';

		for (i in 0...rs.length) {
			var n = rs[i];
			str += '$i: ${n.name}\n';
		}

		return str;
		
	}

	inline function get_length():Int {

		return undo_stack.length + redo_stack.length;
		
	}


}
