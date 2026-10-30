# coco-de-guide

Project plugin for the Data Engineering with CoCo guide (dbt on `DEMO_DB.TPCH_TRANSFORMED`, sourced from `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1`).

It bundles:

- **Skills** (`./skills`) — task workflows such as creating new dbt models that follow project conventions.
- **Agents** (`./agents`) — subagents the main agent can delegate project work to.
- **Hooks** (`./hooks/hooks.json`) — shell commands run automatically on agent events (e.g. before/after tool calls).
