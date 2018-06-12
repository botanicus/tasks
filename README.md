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

---
Monday:
- [19:20] Tap class.

# Last Monday of the month.
Monday(-1):
- Pay rent

# Every 1st.
1:

# OR ...
Pay rent: 1/* # cron.
- xxx
```

### Task list `tasks.yml`

```yaml
# Timestamp and @current is added when tasks start runs.

Today:
- 7:50 Eat breakfast @current
- Write a task management system @programming @important |

--- # Scheduled tasks.

2018-06-07:
- Do something else

--- # Contexts.

Prague:
- Something I have to do in Prague
```

### CLI

- Print the current and coming task with `tasks current` resp. `tasks next`.
- `tasks start` Start the next task.
- `tasks done` Finish the current task, remove it from the task list and add it to an archive with the time stamps.

# TODO

- Use shards build.
- BitBar integration.
- (Neo)Vim plugin.
- Consideration: schedules (static, allowing cron-like date matching + last Sunday etc.). _Dynamic is impossible, since there's no `eval` anyhow._ Could be either in the config or using YAML with ERB `Today: <<*{schedule_name}` + `tasks generate holidays`. It'd expand the `<<` sectio section.
