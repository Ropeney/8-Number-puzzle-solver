# 8 Number Puzzle Solver
#### Goal
Find a path from:

```ruby
7|6|1
2|5|0
8|4|3
```

to:

```ruby
1|2|3
4|5|6
7|8|0
```

## Requirements
`gem install pqueue`

## Performance Comparisons
__Puzzle__: 761250843

##### Breadth First Search

```
Steps to get path: 22
ruby breadth_first_search.rb  60.49s user 0.01s system 99% cpu 1:00.53 total
```

##### Depth first search

```
Steps to get path: 14842
ruby depth_first_search.rb  8.63s user 0.17s system 99% cpu 8.830 total
```

##### A* Search
```
Steps to get path: 22
ruby a\*_search.rb  0.05s user 0.00s system 70% cpu 0.076 total
```
