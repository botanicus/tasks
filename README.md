# About

Very simple task management system.

## Installation

TODO: Write installation instructions here

## Usage

### Configuration file `~/.config/tasks.yml`

```yaml
task_list_path: ~/Desktop/tasks.yml
archive_path: ~/archive/task-archive.yml

# If the coming task has any of the tags defined, the corresponding command
# will execute and if it finishes successfully, task is marked as finished. 
#
# Syntax: tag: command.
commands:
  hs: headspace play
  lf: lifeflow play
```

### Task list `tasks.yml`

```yaml
# Timestamp and @current is added when tasks start runs.

Today:
- 7:50 Eat breakfast @current
- Write a task management system @programming @important

2018-06-07:
- Do something else

Prague:
- Something I have to do in Prague
```

### CLI

- Print the current and coming task with `tasks current` resp. `tasks next`.
- `tasks start` Start the next task.
- `tasks done` Finish the current task, remove it from the task list and add it to an archive with the time stamps.

# TODO

- BitBar integration.
- (Neo)Vim plugin.
- Consideration: schedules (static, allowing cron-like date matching + last Sunday etc.). _Dynamic is impossible, since there's no `eval` anyhow._
