---
layout: post
title: "Algoritmos de ordenação"
math: true
---

# Resumo sobre Algoritmos de ordenação

<!--toc:start-->

- [Resumo sobre Algoritmos de ordenação](#resumo-sobre-algoritmos-de-ordenação)
  - [Bubble sort](#bubble-sort)
  - [Selection sort](#selection-sort)
  - [Insertion sort](#insertion-sort)
  - [Shell sort](#shell-sort)
  - [Quick sort](#quick-sort)
  - [Merge sort](#merge-sort)
  - [Heap sort](#heap-sort)
  - [Comparação entre os Algoritmos](#comparação-entre-os-algoritmos)
    - [Algoritmos lentos](#algoritmos-lentos)
    - [Algoritmos Rápidos](#algoritmos-rápidos)
<!--toc:end-->

| Algoritmo      | Pior caso $O(n)$ | Caso Médio $\Theta(n)$ | Melhor caso $\Omega(n)$    |
| -------------- | ---------------- | ---------------------- | -------------------------- |
| Bubble sort    | $n^2$            | $n^2$                  | $n$                        |
| Selection sort | $n^2$            | $n^2$                  | $n^2$                      |
| Insertion sort | $n^2$            | $n^2$                  | $n$                        |
| Shell sort     | $n^2$            | $n^2$                  | $nlog_2n$ (depende do gap) |
| Quick sort     | $n^2$            | $log_2(n)$             | $log_2n$                   |
| Merge sort     | $log_2(n)$       | $log_2(n)$             | $log_2n$                   |
| Heap sort      | $log_2(n)$       | $log_2(n)$             | $log_2n$                   |

## Bubble sort

<!-- - No melhor cenário a variável `swapped` retorna verdadeiro na primeira interação, ou seja, $\Omega(n)$. -->
<!-- - No pior cenário, `swapped` vai retornar falso $n$ vezes, por tanto $O(n^2)$. -->
<!-- - Em um cenário mediano o `swapped` irá retornar falso $a$ iterações antes de $n$, onde $a$ é constante. Por tanto $\Theta(n^2)$ -->
<!---->

```python
def bubble_sort(a: list[int]) -> None:
    size = len(a)

     def swap(i: int, j: int):
         temp = a[i]
         a[i] = a[j]
         a[j] = temp

     def run_bubble() -> bool:
         swapped = False
         for i in range(size-1):
             if a[i] > a[i+1]:
                 swap(i, i+1)
                 swapped = True
         return swapped

     swapped = run_bubble()
     while swapped:
         swapped =run_bubble()

```

## Selection sort

```python
def selection_sort(a: list[int]) -> None:
    size = len(a)

    def find_min(start_index: int):
        min = start_index
        for i in range(start_index, size):
            if a[i] < a[min]:
                min = i
        return min

    def swap(i: int, j: int):
        temp = a[i]
        a[i] = a[j]
        a[j] = temp

    for i in range(size):
        min_index = find_min(start_index=i)

        if min_index != i:
            swap(min_index, i)
```

## Insertion sort

```python
def insertion_sort(a: list[int]) -> None:
    size = len(a)

    def move_itens_to_left(index: int, value: int) -> int:
        while index >= 0 and value < a[index]:
            a[index+1] = a[index]
            index -= 1
        return index

    def insert(index: int, value: int):
        a[index] = value

    for i in range(1, size):
        current_item = a[i]
        last_index = move_itens_to_left(i-1, current_item)

        if last_index != i:
            insert(last_index + 1, current_item)
```

## Shell sort

```python
def shell_sort(a: list[int]) -> None:

    size = len(a)
    gap = _find_initial_gap(size)

    def swap(i: int, j: int):
        temp = a[i]
        a[i] = a[j]
        a[j] = temp

    def insert(i: int, gap: int):
        for index in range(i+gap, 0, -gap):
            if a[index] < a[index - gap]:
                swap(index - gap, index)

    while gap > 0:

        for i in range(0, size - gap):
            insert(i, gap)

        gap = gap // 2


def _find_initial_gap(size: int):
    gap = 1
    while gap < size:
        gap = gap*3 + 1

    return gap // 3
```

## Quick sort

```python
def quick_sort(a: list[int]) -> None:

    def swap(i: int, j: int):
        temp = a[i]
        a[i] = a[j]
        a[j] = temp

    def partition(low: int, high: int) -> int:
        pivot_value = a[high]
        pivot_index = low - 1

        for i in range(low, high):

            if a[i] <= pivot_value:
                pivot_index += 1
                swap(pivot_index, i)

        pivot_index +=1
        swap(pivot_index, high)
        return pivot_index

    def _sort(low: int, high: int):

        if low >= high:
            return
        pivot = partition(low, high)
        _sort(low, pivot - 1)
        _sort(pivot + 1, high)

    size = len(a)
    low = 0
    high = size - 1

    _sort(low, high)
```

## Merge sort

```python
import sys

def merge_sort(a: list[int]) -> None:

    def _split(begin: int, end: int):
        if end - begin <= 1:
            return

        split_size = (end + begin) // 2
        _split(begin, split_size)
        _split(split_size, end)
        _merge(begin, end, split_size)

    def _merge(begin: int, end: int, split_size: int):
        left = a[begin:split_size]
        right = a[split_size:end]
        # Quando acabar os elementos, de um dos arranjos
        # a comparação current_right <= current_left, sempre irá para o outro arranjo
        # que possui elementos, pois left[-1] ou right[-1] == infinito
        left.append(sys.maxsize)
        right.append(sys.maxsize)
        right_index = 0
        left_index = 0

        current_left = left[left_index]
        current_right = right[right_index]

        for i in range(begin, end):
            if current_left <= current_right:
                a[i] = current_left
                left_index += 1
                current_left = left[left_index]
            else:
                a[i] = current_right
                right_index += 1
                current_right = right[right_index]

    _split(begin=0, end=len(a))
```

## Heap sort

- referencias: [Heap - João Arthur Brunet](https://joaoarthurbm.github.io/eda/posts/heap/)

```python
def heap_sort(a: list[int]) -> None:

    build_max_heap(a)

    size = len(a)

    for i in range(size-1, 0, -1):
        __swap(a, 0, i)
        size -= 1
        heapify(heap=a, current_index=0, heap_size=size)
        


def build_max_heap(a: list[int]):

    size = len(a)
    for i in range(size//2, -1, -1):
        heapify(a, i, size)


def heapify(heap: list[int], current_index: int, heap_size: int):
    l = __left(current_index)
    r = __right(current_index)
    if l < heap_size and heap[l] > heap[current_index]:
        high = l
    else:
        high = current_index

    if r < heap_size and heap[r] > heap[high]:
        high = r

    if current_index != high:
        __swap(heap, current_index, high)
        heapify(heap, high, heap_size)


def __left(i: int) -> int:
    return 2*i + 1


def __right(i: int) -> int:
    return 2*(i + 1)


def __swap(heap: list[int], i: int, j: int):
    temp = heap[i]
    heap[i] = heap[j]
    heap[j] = temp
```

## Comparação entre os Algoritmos

### Algoritmos lentos

![Algoritmos lentos](/assets/img/slow_algorithms.svg)

### Algoritmos Rápidos

![Algoritmos Rápidos](/assets/img/fast_algorithms.svg)

Códigos utilizados para a comparação: [samuel-cavalcanti/sort_algorithms](https://github.com/samuel-cavalcanti/sort_algorithms)
