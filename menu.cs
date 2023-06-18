using Godot;
using System;

public partial class menu : Control
{
	private int selectedButtonIndex;

	public override void _Ready()
	{
		GetSelectedButton("start").GrabFocus();
	}

	private int GetButtonCount()
	{
		return GetNode<BoxContainer>("Buttons").GetChildCount();
	}

	private Button GetSelectedButton(string s)
	{
		return GetNodeOrNull<Button>($"VBoxContainer/{s}");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	private void _on_start_pressed()
	{
		GetTree().ChangeSceneToFile("res://Scenes/Test.tscn");
	}

	private void _on_options_pressed()
	{
		// Replace with function body.
	}

	private void _on_exit_pressed()
	{
		GetTree().Quit();
	}
}








