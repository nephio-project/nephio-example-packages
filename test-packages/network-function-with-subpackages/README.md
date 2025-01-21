# network-function-1

## Description
This is an example demo pacakge with two levels of subpackages, with the main package and all its subpackages deploying
separate deployments of nginx

The package has the following structure:

```
main--+--sub1--+--sub1sub1
      |        |
      |        +--sub1sub2
      |
      +--sub2--+--sub2sub1
               |
               +--sub2sub2
```