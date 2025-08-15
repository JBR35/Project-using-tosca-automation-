# Test Design (Tosca)

## Structure
- **Modules**: `Common\Browser`, `WebApp\Login`
- **TestCases**: `Smoke\Login_Smoke`
- **Data**: Bound from CSV files in `/data`

## ExecutionLists
- `\Execution\Smoke\Login_Smoke`

## Tips
- Use resilient selectors.
- Reuse TestStepBlocks for common actions.
