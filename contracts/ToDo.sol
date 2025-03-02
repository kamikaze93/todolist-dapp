// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ToDo {
    struct Task {
        uint id;
        uint sdate;
        uint edate;
        string task;  
        string author;
        bool done;
    }

    Task[] private tasks;  // Use `private` to restrict direct access

    function addTask(uint sdate, uint edate, string memory task, string memory author) public {
        tasks.push(Task({
            id: tasks.length,
            sdate: sdate,
            edate: edate,
            task: task,
            author: author,
            done: false
        }));
    }

    function getTask(uint index) public view returns (uint, uint, uint, string memory, string memory, bool) {
        require(index < tasks.length, "Invalid index");
        Task storage t = tasks[index];
        return (t.id, t.sdate, t.edate, t.task, t.author, t.done);
    }

    function markTaskAsDone(uint index) public {
        require(index < tasks.length, "Invalid index");
        tasks[index].done = true;
    }

    function getTotalTasks() public view returns (uint) {
        return tasks.length;
    }
}
