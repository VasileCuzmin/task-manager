<script setup>
import TaskItem from './TaskItem.vue';
import { computed, ref } from 'vue';

const props = defineProps({ tasks: Array });
const emit = defineEmits(['update', 'delete', 'toggle']);

const sortOrder = ref('desc')

const sortedTasks = computed(() => {
    return props.tasks.slice().sort((a, b) => {
        const dateA = new Date(a.createdAt)
        const dateB = new Date(b.createdAt)
        return sortOrder.value === 'asc' ? dateA - dateB : dateB - dateA
    })
})

</script>

<template>
    <div class="sort-container">
        <label for="sort" class="sort-label">Sort by:</label>
        <select v-model="sortOrder" id="sort" class="sort-select">
            <option value="desc">Newest First</option>
            <option value="asc">Oldest First</option>
        </select>
    </div>
    <div>
        <TaskItem v-for="task in sortedTasks" :key="task.id" :task="task" @update="emit('update', $event)"
            @delete="emit('delete', $event)" @toggle="emit('toggle', $event)"
            @goToCommentsSection="emit('goToCommentsSection', $event)" />
    </div>
</template>

<style scoped>
.sort-container {
    display: flex;
    align-items: center;
    margin-bottom: 1rem;
    gap: 0.5rem;
}

.sort-label {
    font-weight: bold;
}

.sort-select {
    padding: 0.4rem 0.8rem;
    border-radius: 5px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
    font-size: 1rem;
    cursor: pointer;
    transition: border-color 0.2s ease;
}

.sort-select:hover {
    border-color: #888;
}

.sort-select:focus {
    outline: none;
    border-color: #007bff;
}
</style>