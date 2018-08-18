//= require codemirror/lib/codemirror
//= require codemirror/mode/xml/xml.js
//= require codemirror/addon/mode/overlay

function addLiquidMode() {
  CodeMirror.defineMode('liquid', function (config, parserConfig) {
    const liquidOverlay = {
      token: function (stream) {
        let ch;

        // Variables.
        if (stream.match('{{')) {
          while ((ch = stream.next()) != null)
            if (ch === '}' && stream.next() === '}') break;
          return 'liquid-variable';
        }

        // Tags.
        if (stream.match('{%')) {
          while ((ch = stream.next()) != null)
            if (ch === '%' && stream.next() === '}') break;
          return 'liquid-tag';
        }

        while (stream.next() != null && !stream.match('{{', false) && !stream.match('{%', false)) {}
        return null;
      },
    };
    return CodeMirror.overlayMode(CodeMirror.getMode(config, parserConfig.backdrop || 'text/html'), liquidOverlay);
  });
}


function initCodeMirror({ mode }) {
  const textArea = document.getElementById('codemirror');
  if (!textArea) {
    throw new Error('No element with id codemirror found!');
  }
  addLiquidMode();
  CodeMirror.fromTextArea(textArea, { mode });
}
