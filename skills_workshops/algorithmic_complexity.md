# Algorithmic Complexity - Skills Workshop

[All Workshops](README.md)

## What is Algorithmic Complexity

The complexity is how long an algorithm takes as the data you pass into it scales up.

Example:

I want to know if any given value is in a sorted array.

Find 13 in the array:

`[3, 8, 9, 11, 26, 32, 34]`

### Linear Search:

Try the first one, then go to the next one, and so on.

This has linear complexity, or Big O of n: $O(n)$

### Binary Search:

Find the middle number, if it is 13 the n return true, then find middle number between this and the end of the array, until you either find what 13 or do not.

`11 -> 32 -> 26 -> False`

How many guesses to cover the array of length of any given length?

| Guesses | Size | Power of 2 |
| ------- | ---- | ---------- |
| 2       | 1    | 2          |
| 2       | 3    | 4          |
| 3       | 7    | 8          |
| 4       | 15   | 16         |
| 5       | 31   | 32         |
| 6       | 63   | 64         |
| 7       | 127  | 127        |
| 8       | 511  | 512        |
| 9       | 1023 | 1024       |

These look very similar to the powers of 2.

The size of an array you can cover is equal to $2^n - 1$ where $n$ is the number of guesses.

This is a logarithmic curve when plotted.

It has logarithmic complexity, or Big O of log n: $O(log n)$

### Comparative Speed

| Input Size | Linear Search (ms) | Binary Search (ms) |
| ---------- | ------------------ | ------------------ |
| 10         | 10                 | 4                  |
| 100        | 100                | 7                  |
| 1000       | 1000               | 10                 |
| 1000000    | 1000000            | 20                 |

## Sorting Algorithms

If you had to write your own algorithm that takes an array and sorts it, what do you do?

### Selection Sort

```pseudo
[21, 12, 1, 35, 13, 6, 3, 15];
```

Iterate over the array find the minimum, move it to the result array

```pseudo
[21, 12, 35, 13, 6, 3, 15]
[1]
... eventually ...
[1, 3, 6, 12, 13, 15, 21, 35]
```

Until you sort it all the way through.

For each of the elements you need to check them as many times as the length of the array.

Every time you double the size of the array you quadruple the number of operations, resulting in a quadratic curve.

Plotted this will be a curve like $y = x^2$

This means that the complexity is $O(n^2)$

The quadratic curve will always overtake the linear at some point.

### Insertion Sort

```pseudo
[21, 12, 1, 35, 13, 6, 3, 15];
```

You take the last element of the array (easier to do `.pop()`).

Insert it into the new array.

Then pop the next last element, insert it before or after the element in the new array

```pseudo
[21, 12, 1, 35, 13, 6, 3]
[15]
...
[21, 12, 1, 35, 13, 6]
[3, 15]
...
[21, 12, 1, 35, 13]
[3, 6, 15]
...
[21, 12, 1, 35]
[3, 6, 13, 15]
...
[21, 12, 1]
[3, 6, 13, 15, 35]
...
[21, 12]
[1, 3, 6, 13, 15, 35]
...
[21]
[1, 3, 6, 12, 13, 15, 35]
...
[]
[1, 3, 6, 12, 13, 15, 21, 35]
```

For each element of the starting array it needs to either compare or shift along as many elements as in the results array, so you get a triangle shape. When you double the length of the array it still grows quadratically (but it is still faster than the selection sort).

It is still $O(n^2)$ even through it might be faster than insertion.

## Divide and Conquer

Reduce the problem to smaller problems and solve those, using recursion:

```pseudo
def solve(input):
  if input is simple enough that the solution is trivial
    return solution
  else:
    break input down into input 1 and input 2
    solution1 = solve(input1)
    solution2 = solve(input2)
    solution = merge solution1 and solution2
    return solution
```

### What constitutes a trivial input to sort

| Input    | Output            |
| -------- | ----------------- |
| `[]`     | `[]`              |
| `[2]`    | `[2]`             |
| `[41]`   | `[41]`            |
| `[5, 3]` | `[Too complex!!]` |

If arr.length < 2 return arr

### How to break down the input

```pseudo
[7, 5, 6, 2, 8]

left = arr.slice(0, arr.length / 2)
[7, 5, 6]
right = arr.slice(arr.length / 2, -1)
[2, 8]
```

### How to merge the solutions into one

Compare two equally sized arrays, for the first element of each see which is smallest, put that first then the other, then do teh same for the rest.

## MergeSort Complexity

Example of how it works.

```pseudo
mergesort([21, 12, 1, 35, 13, 6, 3, 15])

Is it length less than 1? No.

  left = [21, 12, 1, 35]

  right = [13, 6, 3, 15]

  mergesort(left)

    Is it length less than 1? No.

    ...etc...
```

How to calculate complexity?

Go over each element in the array in order to sort them.

If length is $n$ what is the depth?

Halve and halve the arrays until they are an array of 1, then put them back together into pairs that are sorted, then arrays that are sorted, then put them into the final solution.

It will be $2 log(n)$ which is pretty good compared.

Doubling the length of the array will .

It actually is $O(n logn)$ where $logn$ grows so slowly its basically a flat line.

## Alternative to Merge Sort: Quick Sort

Instead you could prepare the combined arrays so one array's elements are all bigger than the others.

When you start, shuffle the whole array, so you can take the first value as a pivot and hope that it is okay.

Left will be everything smaller than the pivot, right will be everything bigger.

To combine, take the left, add the pivot, then add the right.

Example:

```pseudo
quicksort([21, 12, 1, 35, 13, 6, 3, 15])

pivot = 21
left = [12, 1, 13, 6, 3, 15]
right = [35]
```

In the worst case scenario it is quadratic, if it is already reverse sorted. but hopefully the shuffle will do well.

In practice it is $O(n logn)$.

QuickSort, or an improved cousin is the algorithm used to sort arrays in most languages?

## Book

Grokking Algorithms

