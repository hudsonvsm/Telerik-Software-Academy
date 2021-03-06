﻿namespace SortingHomework
{
    using System;
    using System.Collections.Generic;

    public class Quicksorter<T> : ISorter<T> where T : IComparable<T>
    {
        public void Sort(IList<T> collection)
        {
            this.QuickSort(collection, 0, collection.Count - 1);
        }

        private void QuickSort(IList<T> collection, int leftIndex, int rightIndex)
        {
            int leftPointer = leftIndex;
            int rightPointer = rightIndex;

            T pivot = collection[(leftIndex + rightIndex) / 2];
            while (leftPointer <= rightPointer)
            {
                while (collection[leftPointer].CompareTo(pivot) < 0)
                {
                    leftPointer++;
                }

                while (collection[rightPointer].CompareTo(pivot) > 0)
                {
                    rightPointer--;
                }

                if (leftPointer <= rightPointer)
                {
                    T swap = collection[leftPointer];
                    collection[leftPointer] = collection[rightPointer];
                    collection[rightPointer] = swap;

                    leftPointer++;
                    rightPointer--;
                }
            }

            if (leftIndex < rightPointer)
            {
                this.QuickSort(collection, leftIndex, rightPointer);
            }

            if (leftPointer < rightIndex)
            {
                this.QuickSort(collection, leftPointer, rightIndex);
            }
        }
    }
}
