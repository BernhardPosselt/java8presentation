title: Collections & Streams & Lambdas in Java 8
theme: sjaakvandenberg/cleaver-light
--
# Streams & Lambdas in Java 8

--
### Iterable
* **forEach** (impure)
* Not affected by Iterator race conditions

```java
Collection<String> collection = Arrays.asList("hi", "there");
collection.forEach(item -> System.out.println(item));
// hi
// there

HashMap<K, V> map = new HashMap<>();
map.forEach((key, value) -> /* etc */);
```

--

### Collection
* **removeIf** (impure)

```java
Collection<String> collection = Arrays.asList("test", "not");

boolean elementWasRemoved = collection.removeIf(value -> value.equals("test"));

collection.equals(Arrays.asList("not"));  // True
elementWasRemoved == true; // True
```

--

### List (1 of 2)

* **replaceAll** (impure)

```java
List<String> list = Arrays.asList("test", "not");

list.replaceAll(s -> s.toUpperCase());  
list.forEach(line -> System.out.println(line));
// TEST
// NOT

list.replaceAll(String::toUpperCase);  // equal to the above
list.forEach(line -> System.out.println(line));
// TEST
// NOT
```

--

### List (2 of 2)
* **sort** (impure)

```java
List<String> list = Arrays.asList("test", "not");

list.sort((a, b) -> a.compareTo(b));
list.forEach(line -> System.out.println(line));
// not
// test

personList.sort(comparing(Person::getName));  // Comparator.comparing()

// two level sorting
personList.sort(comparing(Person::getLastName)
                .thenComparing(Person::getFirstName));

```

--

### Map (lambda, 1 of 2)
* **compute** (impure)
* **computeIfPresent** (impure)
* **computeIfAbsent** (impure)

```java
HashMap<String, String> map = new HashMap<>();
map.put("customer_name", "Frank");

map.compute("customer_name", (key, value) -> value.toUpperCase());
```

--

### Map (lambda, 2 of 2)
* **merge** (impure)
* **replaceAll** (impure)

--
### Map (shorthand, 1 of 2)
* **getOrDefault**: If key not present
* **putIfAbsent**: If key null or absent

```java
HashMap<String, String> map = new HashMap<>();
map.put("customer_name", "Frank");

String address = map.getOrDefault("customer_address", "Heaven");
address.equals("Heaven") == true;  // True

address = map.putIfAbsent("customer_address", "Hell");
address == null;  // True
address = map.putIfAbsent("customer_address", "Hell");
address.equals("Hell") == true;  // True
```

--
### Map (shorthand, 2 of 2)
* **remove**: Remove only if mapped to given value
* **replace**: Replace only if mapped to given value

```java
HashMap<String, String> map = new HashMap<>();
map.put("customer_name", "Frank");

boolean removed = map.remove("customer_name", "John Doe", "Herbert");
removed == false;  // True

boolean replaced = map.replace("customer_name", "John Doe", "Herbert");
replaced == false;  // True
```
