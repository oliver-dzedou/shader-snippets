**Union**

```
float sdUnion(float dist1, float dist2) {
	return min(dist1, dist2);
}
```

**Subtraction**

```
float sdSubstraction(float dist1, float dist2) {
	return max(-dist1, dist2);
}
```

**Intersection**

```
float sdIntersection(float dist1, float dist2) {
	return max(dist1, dist2);
}
```

**XOR**

```
float sdXor(float dist1, float dist2) {
	return max(min(dist1, dist2), -max(dist1, dist2));
}
```

