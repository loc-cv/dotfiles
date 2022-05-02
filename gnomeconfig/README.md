## Get all Gnome settings:

```
dconf dump / >settings.conf
```

## Restore all settings:

```
cat settings.conf | dconf load
```
