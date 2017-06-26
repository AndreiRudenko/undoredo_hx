## undo/redo  
Simple undo/redo for commands

## example  
See src/Main.hx

```haxe

class Main {
        
    static function main() {

        var ur:UndoRedo = new UndoRedo(10);

        var execute = function() {
            trace('execute');
        };

        var cancel = function() {
            trace('cancel');
        };

        ur.add(new Command(execute, cancel, 'cmd name'));

        trace(ur);

        ur.undo();
        ur.redo();
        ur.undo();

        trace(ur);

    }

}

```

