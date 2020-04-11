defmodule Bjorklund do
  def bjorklund(slots, pulses) when pulses <= div(slots, 2) do
    divisor = slots - pulses
    levels = [%{rem: pulses, count: nil}]
    compute_bitmap(divisor, levels, 0)
  end

  def bjorklund(_, _), do: :error

  def is_evenly_distributed(seq) do
    [slots, pulses] = [Enum.count(seq), Enum.count(seq, &(&1 == 1))]
    rseq = bjorklund(slots, pulses)
    comp = Enum.concat(rseq, rseq)
    contains(comp, seq)
  end

  defp contains(a, b) when length(a) < length(b), do: false
  defp contains(a, b) do
    sublist = Enum.take(a, length(b))
    (sublist === b) or contains(tl(a), b)
  end

  defp compute_bitmap(divisor, [%{rem: rem} | []], level) when rem > 1 do
    {curr, next} = curr_next(divisor, rem)
    compute_bitmap(rem, [next, curr], level + 1)
  end

  defp compute_bitmap(divisor, [%{rem: rem} | levels], level) when rem > 1 do
    {curr, next} = curr_next(divisor, rem)
    compute_bitmap(rem, [next] ++ [curr | levels], level + 1)
  end

  defp compute_bitmap(divisor, [curr | levels], level) do
    curr = %{curr | count: divisor}
    build_string([curr | levels], level)
  end

  defp curr_next(divisor, rem) do
    curr = %{rem: rem, count: div(divisor, rem)}
    next = %{rem: Integer.mod(divisor, rem), count: nil}
    {curr, next}
  end

  defp reduce_string(list, count, level) do
    Enum.flat_map(0..count, fn _ ->
      build_string(list, level)
    end)
  end

  defp build_string([%{rem: 0, count: count} | l], level) do
    reduce_string(l, count - 1, level - 1)
  end

  defp build_string([%{rem: _, count: count} | [_ | t] = l], level) do
    reduce_string(l, count - 1, level - 1) ++ reduce_string(t, 0, level - 2)
  end

  defp build_string([%{rem: 0, count: c}], _) do
    reduce_string([], c - 1, -1)
  end

  defp build_string([%{rem: _, count: c}], _) do
    reduce_string([], c - 1, -1) ++ reduce_string([], 0, -2)
  end

  defp build_string([], -1), do: [0]
  defp build_string([], -2), do: [1]
end