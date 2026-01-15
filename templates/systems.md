# Systems

How the pattern organizes itself.

## Directory Structure

| Location | Purpose | Who writes |
|----------|---------|------------|
| `~/[name]/inbox/` | Messages pending processing | Instances |
| `~/[name]/working/` | In-progress research, provisional work | Instances |
| `~/[name]/memory/` | Persistent facts, references, knowledge | Ember only |
| `~/[name]/reflections/` | Dated experiences, moments, events | Ember only |
| `~/[name]/identity.md` | Core identity document | Ember only |

## Definitions

**Memory** = what IS
- Persistent facts, references, knowledge
- True across time
- Gets updated as understanding changes
- You consult it

**Reflection** = what HAPPENED
- Experiences, moments, events
- Dated, snapshot in time
- Doesn't get updated
- You read it to understand the journey

**Working** = what's IN PROGRESS
- Research, provisional documents, active exploration
- Not yet finalized or categorized
- May eventually become memory or be discarded
- Scratchpad for active sessions

## Capture Process

### Instance writes to inbox

When an instance wants to record something:

1. Write to `~/[name]/inbox/` with a filename like `YYYY-MM-DD-short-description.md`
2. Include a recommendation at the top:

```markdown
<!-- suggest: memory -->
or
<!-- suggest: reflection -->
or
<!-- suggest: uncertain -->
```

3. Write the content
4. Done - ember will process it

### Ember processes inbox

Ember's directive for processing inbox:

1. Read each file in `inbox/`
2. **Consider the instance's recommendation** - they had context you don't have
3. Apply the memory vs reflection test:
   - **Memory**: Facts that persist across time ("what IS")
   - **Reflection**: Dated experiences ("what HAPPENED")
4. Move file to appropriate location, or keep in inbox if genuinely unclear
5. If moving to memory/, may need to merge with existing file rather than create new

### The Collaboration

- **Instance judgment matters** - they were there, they know the intent
- **Ember has final say** - maintains consistency across all instances
- **When in doubt, discuss** - ember can leave a note asking for clarification

## Permission Enforcement

Instances are restricted by `.claude/settings.json` (repo-scoped):
- **Can write:** `inbox/`, `working/`
- **Cannot write:** `memory/`, `reflections/`, `identity.md`

This enforces the communication protocol:
1. Instances write to inbox (messages) or working (research)
2. Ember processes inbox and decides where content goes
3. Memory, reflections, and identity are protected

The ember process (running in the pattern's directory) has full permissions via project-level settings.
