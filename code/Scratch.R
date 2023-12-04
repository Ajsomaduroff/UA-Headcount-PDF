{r}
#| label: current ua headcount by IR Group
#| echo: false
#| fig-width: 8
#| fig-asp: 0.618

max_ir_group_xlim <- headcount_data |>
  filter(seq_no == 1) |>
  count(ir_group) |>
  slice_max(n) |>
  select(n) |>
  mutate(n = round(n * 1.10))

max_ir_group_xlim <- max_ir_group_xlim$n

headcount_data |>
  filter(seq_no == 1) |>
  count(ir_group) |>
  mutate(ir_group = factor(ir_group,
                           levels = rev(ir_group_order))) |> # Use this to reorder factors for bar charts (rev for reverse order)
  ggplot(aes(y = ir_group, x = n)) +
  geom_bar(stat = 'identity') +
  geom_text(aes(label = n), hjust = -.1) +
  xlim(NA, max_ir_group_xlim) +
  labs(title = "Employees by IR Group",
       x = "Employees",
       y = NULL) +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.background = element_blank(),
    panel.grid.major.x = element_line('gray90')
  )

# theme(
#   panel.background = element_blank(),
#   
# )