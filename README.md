# About

Very simple task management system.

## Installation

TODO: Write installation instructions here

## Usage

```yaml
# tasks.yml

Today:
# Timestamp and @current is added when tasks start runs.
- 7:50 Eat breakfast @current
- Write a task management system @programming @important

2018-06-07:
- Do something else

Prague:
- Something I have to do in Prague
```

- `tasks current` and `tasks next`: Print the current resp. coming task.
- `tasks start` Start the next task.
- `tasks done` Finish the current task, remove it from the task list and add it to an archive with the time stamps.

# Wishlist

- Support defined commands via `commands.yml`:
```yaml
hs: headspace play
lf: lifeflow play
```
