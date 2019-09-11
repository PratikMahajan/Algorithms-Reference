
# Algorithms Reference 

# Table of Contents

- [Class Definition](#Class-Defination)
    - [Linked List Class](#Linkedlist-Class)
    - [Binary Tree Class](#Binary-Tree-Class)
- [Python Basics](#Python-Basics)
    - [Sorting a Dictionary with key or value](#Sorting-a-Dictionary-with-Key-or-Value)
- [Sorting](#Sorting)
    - [Merge Sort](#Merge-Sort)
- [Arrays](#Arrays)
    - [O(n) Sliding Window Algorithm](#O(n)-Sliding-Window-Algorithm)
    - [Get a Separator in a rotated sorted Array](#Get-a-Separator-in-a-rotated-sorted-Array)
- [Linkedlist](#Linkedlist)
    - [LinkedList MergeSort](#LinkedList-MergeSort)
- [Trees](#Trees)
    - [DFS in Tree](#DFS-in-Tree)
        - [Iterative Solution](#Iterative-Solution)
        - [Recursive Solution](#Recursive-Solution)
- [Graph](#Graph)
    - [Types of Nodes](#Types-of-Nodes)
    - [Types of Edges](#Types-of-Edges)
    - [What is Discovery Time and Finish Time](#What-is-Discovery-Time-and-Finish-Time)
    - [Topological sort with DFS Algorithm basics](#Topological-sort-with-DFS-Algorithm-basics)
        - [Topological Sort Algo](#Topological-Sort-Algo)
        - [Sample Topological Sort Code](#Sample-Topological-Sort-Code)
    - [BellmanFord](#BellmanFord)
    - [Dijkstras](#Dijkstras)

# Class Definition


```python
import sys
```

##### Linkedlist Class


```python
class ListNode(object):
    def __init__(self, x=None):
        self.val = x
        self.next = None
        
def printLL(node):
    while node:
        print (node.val, end="->")
        node=node.next

def populateLL(array):
    node= ListNode(0)
    backup=node
    for element in array:
        node.next=ListNode(element)
        node=node.next
    return backup.next
```

##### Binary Tree Class


```python
class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
```

 

# Python Basics

## Sorting a Dictionary with Key or Value

##### Sort by Key
```python
result = OrderedDict(sorted(unsorted.items(), key= lambda x:x[0]))
```

##### Sort by Value
```python
result = OrderedDict(sorted(unsorted.items(), key= lambda x:x[1]))
```

##### Get items in Sorted Order
```python
result = [unsorted[key] for key in sorted(unsorted.keys())]
```

 

# Sorting

## Merge Sort 


```python
class MergeSort(object):
    def merge(self, a1, a2):
        i,j=0,0
        res=[]
        while i<len(a1) and j<len(a2):
            if a1[i]>a2[j]:
                res.append(a2[j])
                j+=1
            else:
                res.append(a1[i])
                i+=1
        if i<len(a1):
            res+=a1[i:]
        if j<len(a2):
            res+=a2[j:]
        return res

    def split(self, array):
        if len(array)==1:
            return [array[0]]
        if len(array)==2:
            return self.merge([array[0]],[array[1]])
        else:
            lo=0
            hi=len(array)-1
            mid=int((lo+hi)/2)
            return self.merge(self.split(array[:mid]),self.split(array[mid:]))


MergeSort().split([1,2,3,9,8,7,6,5,4,3,2,1])
```




    [1, 1, 2, 2, 3, 3, 4, 5, 6, 7, 8, 9]



 

# Arrays

## O(n) Sliding Window Algorithm
**Pseudo algorithm for Ordered Dictionary**

Can modify this algorithm to suit any type of problem which involves any kind of sliding window. 


```python
class OrderedDict(object):
    def __init__(self,capacity):
        self.capacity=capacity
        self.head=ListNode("-inf")
        self.tail=ListNode("-inf")
        self.head.next=self.tail
        self.tail.prev=self.head
        self.dict={}
        
    def addTail(self,key):
        node= ListNode(key)
        node.prev= self.tail.prev
        node.next=self.tail
        self.tail.prev.next=node
        self.tail.prev=node
        self.dict[key]=node
        if len(self.dict)>self.capacity:
            self.removeHead()
        
    def removeNode(self,key):
        node= self.dict[key]
        node.prev.next=node.next
        node.next.prev=node.prev
        del self.dict[key]
        
    def removeHead(self):
        key= self.head.next.val
        self.removeNode(key)
        
obj= OrderedDict(4)
obj.addTail(12)
print(printLL(obj.head))
obj.addTail(13)
obj.addTail(14)
obj.addTail(15)
print(printLL(obj.head))
obj.addTail(16)
print(printLL(obj.head))
obj.removeNode(14)
print(printLL(obj.head))
```

    -inf->12->-inf->None
    -inf->12->13->14->15->-inf->None
    -inf->13->14->15->16->-inf->None
    -inf->13->15->16->-inf->None



```python
int((0+1)/2)
```




    0



## Get a Separator in a rotated sorted Array
**Modification of Binary search**


```python
class SortedSeparator(object):
    def getSeparator(self,nums):
        lo=0
        hi=int(len(nums)-1)
        while lo<hi:
            mid=int((lo+hi)/2)
            if nums[mid]>nums[hi]:
                lo=mid+1
            else:
                hi=mid   
        return lo
print(SortedSeparator().getSeparator([7,8,9,10,12,23,45,67,1,3,4,5,6]))
```

    8



```python
arr=list(range(12))
print (arr[8-1::-1])
```

    [7, 6, 5, 4, 3, 2, 1, 0]


 

# Linkedlist

## LinkedList MergeSort


```python
class LLMergeSort(object):
    def getMid(self, llist):
        if llist.next==None:
            return llist, None
        slowp= llist
        fastp= llist.next
        while fastp:
            if fastp.next:
                fastp=fastp.next.next
            else:
                break
            llist=llist.next
        mid= llist.next
        llist.next=None
        return slowp, mid


    def merge(self,list1,list2):
        res= ListNode(0)
        backup= res
        while list1 and list2:
            if list2.val<list1.val:
                res.next=list2
                res=res.next
                list2=list2.next
                res.next=None
            else:
                res.next=list1
                res=res.next
                list1=list1.next
                res.next=None
        res.next = list1 or list2
        return backup.next


    def split(self,llist):
        start,mid=self.getMid(llist)
        if mid== None:
            return start
        else:
            return self.merge(self.split(start),self.split(mid))

        
def runLLMS():
    LL= populateLL([10,9,8,4,7,6,5,3,2,53,1])
    res= LLMergeSort().split(LL)
    print(printLL(res))

runLLMS()
```

    1->2->3->4->5->6->7->8->9->10->53->None


 

# Trees

## DFS in Tree

### Iterative Solution


```python
def dfs(self,root):
    stack=[]

    while root or stack:
        while root:
            stack.append(root)
            root=root.left

        node=stack.pop()
        print (node.val)
        root=node.right
```

### Recursive Solution


```python
def dfsInorder(self,node):
    if not node:
        return 
    
    self.dfsInorder(node.left)
    print (node.val)
    self.dfsInorder(node.right)
```


```python
def dfsPostorder(self,node):
    if not node:
        return 
    
    self.dfsPostorder(node.left)
    self.dfsPostorder(node.right)
    print (node.val)
```


```python
def dfsPreorder(self,node):
    if not node:
        return 
    
    print (node.val)    
    self.dfsPreorder(node.left)
    self.dfsPreorder(node.right)
```

 

# Graph

## Types of Nodes
1. Black: No outgoing or all outgoing nodes are visited
2. Grey: Currently exploring the node, but not yet finished
3. White: Currently unexplored node, i.e. not yet visited

## Types of Edges
1. Grey to White: Discovery Edge
2. Grey to Grey: Back Edge
3. Grey(first) to Black: Forward Edge
4. Grey to Black(first): Cross Edge

## What is Discovery Time and Finish Time
Consider that you start at node A. The discovery time of this node will be 1 as it is the first node. As we go deep into the graph, keep incrementing this number. When we reach a node which has no outgoing edge, we consider that the discovery of this node is complete, thats when we mark it as finish time. As we come one level up after completed discovery, we still keep on incrementing this time untill the end of algorithm. This time can be imaginary and we dont have to keep track of it. Its just the order in which we discover and finish discovering a node. Thus the source will be the first one to be discovered and last one to be finished in its own tree. 

## Topological sort with DFS Algorithm basics
* If next node is white, convert it from white to grey and keep going deep. 
* if there is no outgoing node from the current node, convert it to black and go one level up. 
* Once all the node is marked as black, insert it to the front of the LinkedList that keeps node in a topologically sorted order.
* If all child nodes are black, convery the current node(grey) to black and go one level up. 
* If while exploring, we encounter a node which is grey, there is a cycle in graph. (Cycle should not be there in a DAG- Directed Acyclic Graph). Its better to check for this condition as it has various uses in Algorithms. In this case, add this node to a list of cycling nodes. One way to handle it can be convert it to black and go one level up. 
* If all nodes originating at one source are traversed, check if there is any independent tree in the graph. If yes, continue the same algorithm again. 

Here,
* Visited :
	* Can be an array where 
		* 0-> White
		* -1 -> Black
		* 1 -> Grey
	* if we consider it as a `set` , we will have to maintain 3 sets, one each for white, grey and black. 
* We will have to maintain a LinkedList to keep toplogically sorted nodes in order. Or we can also use an OrderedDict which is nothing but a datastructure made up of dictionary and linkedlist. 

### Topological Sort Algo
*According to Algorithm Design-CLRS*<br/>
TOPOLOGICAL-SORT(G)<br/>
1. call DFS(G) to compute finishing times 􏰁v.f for each vertex 􏰁v<br/>
2. as each vertex is finished, insert it onto the front of a linked list<br/>
3. return the linked list of vertices<br/>


### Sample Topological Sort Code


```python
# 207. Course Schedule on Leetcode

from collections import defaultdict
class Listnode(object):
    def __init__(self,key):
        self.key=key
        # self.val=val
        self.next=None


class Solution(object):
    def canFinish(self, n, pres):
        """
        :type numCourses: int
        :type prerequisites: List[List[int]]
        :rtype: bool
        """
        self.graph = defaultdict(set)
        for req in pres:
            prereq=req[1]
            subj=req[0]
            self.graph[prereq].add(subj)
        self.ordered=Listnode(float("inf"))
        self.white= set([i for i in xrange(n)])
        self.black=set()
        self.cycles=set()
        self.grey=set()
        for i in xrange(n):
            if i in self.white:
                self.dfs(i)
        # print self.white,self.grey,self.black,self.cycles
        return len(self.cycles)==0
        
        
    def dfs(self,node):
        if node in self.black:
            return 1
        if node in self.grey:
            self.cycles.add(node)
            return 1
        if node in self.white:
            self.white.remove(node)
            self.grey.add(node)
            child= 0 if not node in self.graph else len(self.graph[node])
            if child==0:
                ll=Listnode(node)
                ll.next=self.ordered.next
                self.ordered.next=ll
                self.grey.remove(node)
                self.black.add(node)
            else:
                for nd in self.graph[node]:
                    child-=self.dfs(nd)
                    if child==0:
                        ll=Listnode(node)
                        ll.next=self.ordered.next
                        self.ordered.next=ll
                        self.grey.remove(node)
                        self.black.add(node)
                        
            return 1
        return 
                
```

## BellmanFord

### BellmanFord Sample Code


```python
# 787. Cheapest Flights Within K Stops on Leetcode

from collections import defaultdict
class Solution(object):
    def findCheapestPrice(self, n, flights, source, dest, K):
        """
        :type n: int
        :type flights: List[List[int]]
        :type src: int
        :type dst: int
        :type K: int
        :rtype: int
        """
        #create graph 
        graph = defaultdict(dict)
        for flight in flights:
            src= flight[0]
            to= flight[1]
            cost=flight[2]
            
            graph[src][to]=cost
        #initializeSingleSource
        distdict= defaultdict(int)
        for i in range(n):
            distdict[i]=float("inf")
        distdict[source]=0
  
        #BellManFord
        for _ in range(n-1):
            for fro in graph:
                for to in graph[fro]:
                    newdist= distdict[fro]+graph[fro][to]
                    distdict[to]=min(newdist,distdict[to])
        return -1 if distdict[dest]==float("inf") else distdict[dest]
            
```

## Dijkstras

### Dijkstras Sample Code


```python
# 743. Network Delay Time On Leetcode

from collections import defaultdict
from heapq import *
class Solution(object):
    def networkDelayTime(self, times, N, K):
        """
        :type times: List[List[int]]
        :type N: int
        :type K: int
        :rtype: int
        """
        #Create Graph 
        graph=defaultdict(dict)
        for node in times:
            src= node[0]
            dst=node[1]
            wt= node[2]
            graph[src][dst]=wt
        start=K
        
        dist=[float("inf")]*N
        dist[start-1]=0
        
        S=set()
        Q=[]
        #populate the Q for source
        heappush(Q,(0,start))

        
        while Q:
            # print Q
            wt,u=heappop(Q)
            S.add(u)
            # Q=[]
            for v in graph[u]:
                #Relax all vertices
                dist[v-1]=min(dist[v-1],dist[u-1]+graph[u][v])
                #greedy algo, replace q by greedy vertices for current vertice
                if v not in S:
                    heappush(Q,(graph[u][v],v))
        # print dist
        return max(dist) if max(dist)<float("inf") else -1
        
```


```python

```
