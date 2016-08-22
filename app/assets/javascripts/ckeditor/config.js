//= require ckeditor/init


CKEDITOR.config.toolbar= [
{ name: 'document', items: [ 'Source', '-', 'NewPage', 'Preview' ] },
{ name: 'insert',      items: [ 'Image','Table','SpecialChar', '-', 'Maximize', 'ShowBlocks', '-', 'Link','Unlink' ] },
'/',
{ name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
{ name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
'/',
{ name: 'styles',      items: [ 'Styles','Format','Font','FontSize' ] },
{ name: 'colors',      items: [ 'TextColor','BGColor' ] },
];