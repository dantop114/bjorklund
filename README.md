# Björklund's Algorithm in Elixir

I've read the Godfried Toussaint's work, [The _Euclidean_ Algorithm Generates Traditional Musical Rhythms](http://cgm.cs.mcgill.ca/~godfried/publications/banff.pdf). This paper describes how is possible to generate percussive rhythms using an Euclidean algorithm and how many classical rhythms have a link with this principle. 

The paper also cite the Björklund's work [The Theory of Rep-Rate Pattern Generation in the SNS Timing System](https://pdfs.semanticscholar.org/c652/d0a32895afc5d50b6527447824c31a553659.pdf) where an algorithm to distribute _k_ pulses (1s) in _n_ slots of time is presented and shows how this algorithm is bounded to the Euclidean principle. 

I decided to translate the algorithm in Elixir.

The module has two public functions:

- `bjorklund(slots, pulses)`, returns a list that represents the sequence of `pulses` 1s evenly distributed in `slots` units
- `is_evenly_distributed(seq)`, checks if `seq` is an evenly distributed sequence of 1s.

## How to use

Here is an example usage (in iex):

```elixir
iex(1)> Bjorklund.bjorklund 15, 6                                             
[0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0]
iex(2)> Bjorklund.is_evenly_distributed [1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0] 
true
iex(3)> Bjorklund.is_evenly_distributed [0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0] 
false
```
