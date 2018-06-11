# About

Very simple task management system.

## Installation

TODO: Write installation instructions here

## Usage

```yaml
# tasks.yml

Today:
- Write a task management system

2018-06-07:
- Do something else

Prague:
- Something I have to do in Prague

# This is added when start is called and removed when done is called.
_timestamp: <timestamp>
```

- `tasks next` Print the coming task.
- `tasks start` Start the next task.
- `tasks done` Finish the current task, remove it from the task list and add it to an archive with the time stamps.

# Wishlist

- Support tags.
- Support defined commands via `commands.yml`:
```yaml
hs: headspace play
lf: lifeflow play
```
