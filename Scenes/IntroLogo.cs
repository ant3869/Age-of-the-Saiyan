using Godot;
using System;

public partial class IntroLogo : VideoStreamPlayer
{
 public override void _Ready()
    {
		Callable callable = new Callable(this, MethodName._on_video_finished);
        Connect("finished", callable);
        Play();
    }

    private void _on_video_finished()
    {
        // Transition to the main menu scene
        GetTree().ChangeSceneToFile("res://menu.tscn");
    }
}
