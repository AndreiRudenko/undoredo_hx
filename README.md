## undo/redo  
Simple undo/redo for commands

## example  
See src/Main.hx

```haxe

class Main {
        
    static function main() {

        var ur:UndoRedo = new UndoRedo(10);

        var undo = function() {
            trace('undo: $_name');
        };

        var redo = function() {
            trace('redo: $_name');
        };

        ur.add(new Command(undo, redo, 'cmd name'));

        trace(ur);

        ur.undo();
        ur.redo();
        ur.undo();

        trace(ur);

    }

}

```

