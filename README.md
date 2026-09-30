# rpg-callouts

Stand-alone Jekyll plugin that merges Just the Docs callout definitions into the host site config.

| Class | Title | Color |
| --- | --- | --- |
| `monster` | Monster | red |
| `monster-no-title` | — | red |
| `item` | Item | blue |

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
