package exercise.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.net.URI;
import java.util.List;

import exercise.model.Task;
import exercise.repository.TaskRepository;
import exercise.exception.ResourceNotFoundException;

@RestController
@RequestMapping("/tasks")
@Slf4j
public class TasksController {

    @Autowired
    private TaskRepository taskRepository;

    @GetMapping(path = "")
    public List<Task> index() {
        return taskRepository.findAll();
    }

    @GetMapping(path = "/{id}")
    public Task show(@PathVariable long id) {

        var task =  taskRepository.findById(id)
            .orElseThrow(() -> new ResourceNotFoundException("Task with id " + id + " not found"));

        return task;
    }

    // BEGIN
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping(path = "")
    public Task create(@RequestBody Task newTask) {
        var oldTask = taskRepository.findByTitle(newTask.getTitle());
        if (oldTask.isPresent()) {
            ResponseEntity.status(HttpStatus.CONFLICT).body("Task " + newTask.getTitle() + " already exists");
        }
        return taskRepository.save(newTask);
    }

    @ResponseStatus(HttpStatus.OK)
    @PutMapping(path = "/{id}")
    public Task update(@PathVariable String id, @RequestBody Task newTask) {
        var oldTask = taskRepository.findById(Long.valueOf(id))
                .orElseThrow(() -> new ResourceNotFoundException("Task " + newTask.getTitle() + " was not found"));
        oldTask.setTitle(newTask.getTitle());
        oldTask.setDescription(newTask.getDescription());
        return taskRepository.save(oldTask);
    }
    // END

    @DeleteMapping(path = "/{id}")
    public void delete(@PathVariable long id) {
        taskRepository.deleteById(id);
    }
}
