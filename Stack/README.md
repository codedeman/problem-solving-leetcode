## Monotonic stack 📚 
### Monotonic stack increasing 
Before push into stack the conditon should be 
stack is not empty and top elements of stack bigger than elements before pushing 
then push the elements into stack 

``` swift
func push(value: Int) {
    while !stack.isEmpty && stack.last > value {
        stack.removeLast()
    }
    stack.append(value)
}
    

```


### Monotonic stack decreasing 
Before push into stack the conditon should be 
stack is not empty and top elements of stack smaller elements before pushing 
then push the elements into stack 
``` swift 

func push(value: Int) {

    while !stack.isEmpty && stack.last < value {
        stack.removeLast()
    }
    stack.append(value)
}

```
