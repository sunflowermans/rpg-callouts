# rpg-callouts

Stand-alone Jekyll plugin that merges Just the Docs callout definitions into the host site config.

| Class | Title | Color |
| --- | --- | --- |
| `monster` | Monster | red |
| `monster-no-title` | — | red |
| `item` | Item | blue |

<img width="746" height="217" alt="Screenshot_20260930_092143" src="https://github.com/user-attachments/assets/0bdac732-5da7-4be6-8328-b88e8ef8a674" />
<img width="742" height="124" alt="Screenshot_20260930_092214" src="https://github.com/user-attachments/assets/9eb4f089-2497-458f-8dbb-1f44bdadfdb9" />
<img width="742" height="207" alt="Screenshot_20260930_092458" src="https://github.com/user-attachments/assets/ed6c1fdf-9af1-42df-b80d-5a4ed476ac26" />
<img width="744" height="125" alt="Screenshot_20260930_092516" src="https://github.com/user-attachments/assets/42ea2669-96a2-4120-9e54-12af500a5d67" />


Site `_config.yml` wins if you redefine the same callout names. Merge is in memory only — nothing is copied into the site source.

## Install

```ruby
group :jekyll_plugins do
  gem "rpg-callouts", path: "../rpg-callouts"
end
```

```yaml
# _config.yml
plugins:
  - rpg-callouts
```

## Usage

```markdown
{: .monster}
> **Goblin**
>
> AC 6 [13], HD 1-1 (3hp), Att 1 × spear (1d6)

{: .item}
> **Silver Key**
>
> Opens the locked door in area 3.

{: .monster-no-title}
> Same red styling, no "Monster" heading.
```

## Options

```yaml
# _config.yml
rpg_callouts:
  enabled: true                 # set false to skip
  config_file: callouts.yml     # optional alternate YAML (absolute or site-relative)
```

Default definitions live in `callouts/config.yml` inside this gem.
