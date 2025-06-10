<script setup>
const props = defineProps({ task: Object });
const emit = defineEmits(['update', 'delete', 'toggle']);
import { computed } from 'vue';

// Format the date (e.g., "10/06/2025")
const formattedDate = computed(() => {
    const date = new Date(props.task.createdAt)
    return date.toLocaleDateString('en-GB')
})
</script>

<template>
    <div class="task-card">
        <h3>
            <span :style="{ textDecoration: task.isCompleted ? 'line-through' : 'none' }">
                {{ task.title }} - {{ formattedDate }}
            </span>
        </h3>
        <p>{{ task.description }}</p>
        <button @click="emit('update', task)">Edit</button>
        <br>
        <button @click="emit('delete', task.id)">Delete</button>
        <br>
        <button @click="emit('goToCommentsSection', task.id)">Go to comments section</button>
    </div>
</template>