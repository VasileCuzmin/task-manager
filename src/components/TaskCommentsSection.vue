<template>
    <div class="comments-section">
        <h3>💬 Comentarii</h3>

        <form @submit.prevent="addComment">
            <input v-model="newComment" placeholder="Scrie un comentariu..." required />
            <button type="submit">Adaugă</button>
        </form>

        <ul>
            <li v-for="(comment, index) in comments" :key="index">
                {{ comment }}
                <button @click="deleteComment(index)">🗑️</button>
            </li>
        </ul>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';

const comments = ref([]);
const newComment = ref('');

const mockComments = [
    'Pare o sarcină importantă.',
    'Am adăugat un comentariu ca test.',
    'Se poate împărți în subtasks?',
    'Verificat – totul e în regulă.'
];

onMounted(() => {
    debugger
    comments.value = [...mockComments];
});

const addComment = () => {
    if (newComment.value.trim()) {
        comments.value.push(newComment.value.trim());
        newComment.value = '';
    }
};

const deleteComment = (index) => {
    comments.value.splice(index, 1);
};
</script>

<style scoped>
.comments-section {
    margin-top: 1rem;
}

form {
    margin-bottom: 1rem;
    display: flex;
    gap: 0.5rem;
}

input {
    flex: 1;
    padding: 0.4rem;
}

button {
    padding: 0.3rem 0.7rem;
    cursor: pointer;
}

ul {
    list-style: none;
    padding: 0;
}

li {
    margin-bottom: 0.4rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
</style>
