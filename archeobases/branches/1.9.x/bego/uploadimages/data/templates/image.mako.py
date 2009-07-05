from mako import runtime, filters, cache
UNDEFINED = runtime.UNDEFINED
__M_dict_builtin = dict
__M_locals_builtin = locals
_magic_number = 5
_modified_time = 1246119122.483
_template_filename='C:\\Documents and Settings\\portable 1\\Bureau\\BegoPylons\\uploadimages\\uploadimages\\templates/image.mako'
_template_uri='image.mako'
_template_cache=cache.Cache(__name__, _modified_time)
_source_encoding='utf-8'
from webhelpers.html import escape
_exports = []


def render_body(context,**pageargs):
    context.caller_stack._push_frame()
    try:
        __M_locals = __M_dict_builtin(pageargs=pageargs)
        h = context.get('h', UNDEFINED)
        c = context.get('c', UNDEFINED)
        __M_writer = context.writer()
        # SOURCE LINE 1
        __M_writer(u'id = ')
        __M_writer(escape(c.record.id))
        __M_writer(u' </br>\nfile_path = ')
        # SOURCE LINE 2
        __M_writer(escape(c.record.file_path))
        __M_writer(u' </br>\nthumb_path = ')
        # SOURCE LINE 3
        __M_writer(escape(c.record.thumb_path))
        __M_writer(u' </br>\ndescription = ')
        # SOURCE LINE 4
        __M_writer(escape(c.record.description))
        __M_writer(u' </br>\n</br>\n</br>\nthumb : ')
        # SOURCE LINE 7
        __M_writer(escape(h.image("../../uploads/"+c.record.thumb_path, "thumb")))
        __M_writer(u'</br></br></br>\nfile : ')
        # SOURCE LINE 8
        __M_writer(escape(h.image("../../uploads/"+c.record.file_path, "file")))
        __M_writer(u'</br></br></br>\n')
        return ''
    finally:
        context.caller_stack._pop_frame()


