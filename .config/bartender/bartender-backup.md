# Backing up bartender

```
mkdir -p ~/.config/bartender

defaults export com.surteesstudios.Bartender $(pwd)/BartenderPrefs.plist
```

That's it

To restore. 

```
defaults import com.surteesstudios.Bartender $(pwd)/BartenderPrefs.plist
``



