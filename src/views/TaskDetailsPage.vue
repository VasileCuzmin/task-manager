<template>
    <div v-if="task">
        <h2>{{ task.title }}</h2>
        <p>{{ task.description }}</p>
        <router-link :to="`/tasks/${$route.params.id}/comments`">Comments</router-link>

        <router-view /> <!-- Aici se încarcă componenta nested -->
    </div>
</template>
<script>
import { mapGetters } from 'vuex';
export default {
    props: ['id'],
    computed: {
        ...mapGetters('tasks', ['getTask']),
        task() { return this.getTask(this.id); }
    }
};
</script>