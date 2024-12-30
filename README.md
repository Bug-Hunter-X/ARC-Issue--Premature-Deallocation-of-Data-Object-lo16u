# Objective-C ARC Issue: Premature Deallocation

This repository demonstrates a common error in Objective-C related to Automatic Reference Counting (ARC) and memory management. The issue involves a scenario where a data object is deallocated prematurely due to an improper understanding of strong references within an object's initializer.

## The Problem

The `bug.m` file shows the problematic code. When a `MyClass` object is initialized with a data object created inside the method, if that data object is not referenced anywhere else other than inside the MyClass object, then the reference count of this data object becomes zero after the initializer runs.  Attempts to access this deallocated object will lead to a crash. 

## The Solution

The `bugSolution.m` file provides a corrected version.  The solution typically involves ensuring the object's reference count is appropriately managed, perhaps by either creating the NSData object outside of the initializer method and passing it in, or holding a strong reference to the data somewhere else before assigning it to self.data.