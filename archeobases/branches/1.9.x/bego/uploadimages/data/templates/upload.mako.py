from mako import runtime, filters, cache
UNDEFINED = runtime.UNDEFINED
__M_dict_builtin = dict
__M_locals_builtin = locals
_magic_number = 5
_modified_time = 1245924767.885
_template_filename='C:\\Documents and Settings\\portable 1\\Bureau\\BegoPylons\\uploadimages\\uploadimages\\templates/upload.mako'
_template_uri='/upload.mako'
_template_cache=cache.Cache(__name__, _modified_time)
_source_encoding='utf-8'
from webhelpers.html import escape
_exports = []


def render_body(context,**pageargs):
    context.caller_stack._push_frame()
    try:
        __M_locals = __M_dict_builtin(pageargs=pageargs)
        h = context.get('h', UNDEFINED)
        __M_writer = context.writer()
        # SOURCE LINE 1
        __M_writer(escape(h.form(h.url_for(action="save_image"), multipart=True)))
        __M_writer(u'\nUpload file: ')
        # SOURCE LINE 2
        __M_writer(escape(h.file("image")))
        __M_writer(u' <br />\nFile description: ')
        # SOURCE LINE 3
        __M_writer(escape(h.text("description")))
        __M_writer(u' <br />\n')
        # SOURCE LINE 4
        __M_writer(escape(h.submit("Submit", "Submit")))
        __M_writer(u'\n')
        # SOURCE LINE 5
        __M_writer(escape(h.end_form()))
        __M_writer(u'\n')
        return ''
    finally:
        context.caller_stack._pop_frame()


