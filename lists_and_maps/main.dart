typedef DataMap = Map<String, List<String>>;
typedef SizeMap = Map<int, List<String>>;

SizeMap getCounts(m) {
  SizeMap newMap = <int, List<String>>{};
  m.forEach((key, value) {
    if(!newMap.containsKey(value.length)){
      var newList = <String>[];
      newList.add(key);
      newList.sort();
      newMap[value.length] = newList;
    }
    else {
      newMap[value.length]!.add(key);
      newMap[value.length]!.sort();
    }
  }); 
  return newMap;
}

void addShortest(x, m) {
  SizeMap counts = getCounts(m);
  var shortest;
  counts.forEach((key, value){
    if(shortest == null) {
      shortest = key;
    }
    else {
      if (key < shortest) {
        shortest = key;
      }
    }
  });
  m[counts[shortest]![0]].add(x);
}


void main() {
  var data = {
    "One": ["a", "x"],
    "Two": ["b", "c", "z"],
    "Three": ["f", "g", "h"]
  };
  print(getCounts(data));
  addShortest('g', data);
  print(data);
}

/*
{2: [One], 3: [Three, Two]}
{One: [a, x, g], Two: [b, c, z], Three: [f, g, h]}
*/


// I got some hints from ChatGPT on this code. I wrote most of it myself.