Vue.component('youtube-block', {
    props: ['uid', 'model'],
    template: '<div class="block-body"><input :id="uid" style="width:100%" v-model.lazy="model.body.value"></input><div class="container"><div class="embed-container"><iframe :src="model.body.value" frameborder="0" allowfullscreen></iframe></div></div></div>'
});