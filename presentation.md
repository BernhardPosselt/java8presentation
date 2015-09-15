# Iterarble
For loop has explicit loop which is a problem for concurrent iterator access whereas forEach is not affected by it

```java
Collection<String> collection = Arrays.asList("hi", "there");
collection.forEach(item -> System.out.println(item));
// hi
// there

HashMap<K, V> map = new HashMap<>();
map.forEach((key, value) -> /* etc */);
```

--

# Collection

```java
Collection<String> collection = Arrays.asList("test", "not");

collection
  .removeIf(value -> value.equals("test"))
  .equals(Arrays.asList("not"));  // True
```

--

# List
Mapping over a list (replaceAll) and sorting

```java
Collection<String> collection = Arrays.asList("test", "not");

collection
  .replaceAll(s -> s.toUpperCase())
  .equals(Arrays.asList("TEST", "NOT"));

collection.sort((a, b) -> a.compareTo(b));
```

--

# Map
