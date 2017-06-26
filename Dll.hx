package ;


// doubly linked list

@:generic
class Dll<T> {


	public var head (default, null) : DllNode<T>;
	public var tail (default, null) : DllNode<T>;

	public var length(default, null):Int = 0;


	public function new(_reserved_size:Null<Int> = 0) {

		head = null;
		tail = null;

	}

	public inline function add_first(_value:T) : DllNode<T> {

		var node = new DllNode();
		node.value = _value;

		node.next = head;
		if (head != null){
			head.prev = node;
		} else {
			tail = node;
		}

		head = node;
		
		length++;

		return node;

	}

	public inline function add_last(_value:T) : DllNode<T> {

		var node = new DllNode();
		node.value = _value;

		if (tail != null) {
			tail.next = node;
			node.prev = tail;
		} else{
			head = node;
		}

		tail = node;
		
		length++;

		return node;

	}

	public inline function get_first() : T {

		if(length == 0) {
			return null;
		}

		return head.value;

	}

	public inline function get_last() : T {

		if(length == 0) {
			return null;
		}

		return head.value;

	}

	public function rem_first() : T {

		if(length == 0) {
			return null;
		}
		
		var node = head;
		if (head == tail){
			head = tail = null;
		} else {
			head = head.next;
			node.next = null;
			head.prev = null;
		}

		length--;

		return node.value;

	}

	public function rem_last() : T {
		
		if(length == 0) {
			return null;
		}

		var node = tail;
		if (head == tail){
			head = tail = null;
		} else {
			tail = tail.prev;
			node.prev = null;
			tail.next = null;
		}
		
		length--;

		return node.value;

	}

	public function clear(gc:Bool = true){

		if (gc) {
			var node = head;
			var next = null;
			while(node != null) {
				next = node.next;

				node.prev = null;
				node.next = null;
				node.value = null;

				node = next;
			}
		}
		
		head = tail = null;
		length = 0;
		
	}

	public function toArray() : Array<T> {

		if(length == 0) {
			return [];
		}

		var a : Array<T> = [];
		var node = head;

		while(node != null) {
			a.push( node.value );
			node = node.next;
		}

		return a;

	}

	inline function toString() {

		var _list = toArray(); 

		return 'node: [${_list.join(", ")}]';

	}

	public inline function iterator():Iterator<T> {

		return new DLLIterator<T>(head);

	}


}


private class DllNode<T> {

	public var value : Null<T>;
	public var next : DllNode<T>;
	public var prev : DllNode<T>;

	public function new() {}

}


private class DLLIterator<T> {

	var node:DllNode<T>;
	
	public inline function new(head:DllNode<T>){

		node = head;

	}

	public inline function hasNext():Bool {

		return node != null;

	}
	
	public inline function next():T {

		var _value = node.value;
		node = node.next;
		return _value;

	}
	
}
