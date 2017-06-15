package ;


class Command {


	public var name:String;

	public var execute:Void->Void;
	public var cancel:Void->Void;

	public var next:Command;
	public var prev:Command;
	

	public function new(_cancel:Void->Void, _execute:Void->Void, _name:String = '') {

		execute = _execute;
		cancel = _cancel;
		name = _name;

	}


}
