// Fix large blog rendering OOM
const postHtmlFilter = hexo.extend.filter.list()['after_render:html'];
for (let filter of postHtmlFilter) {
    if (filter.name === 'hexoMetaGeneratorInject') {
        hexo.extend.filter.unregister('after_render:html', filter);
    }
}

