/* The following code was generated by JFlex 1.4.3 on 5/11/15 5:12 PM */

/* --------------------------Seccion codigo-usuario ------------------------ */
//import java_cup.runtime.Symbol;
import java_cup.runtime.*;


/**
 * This class is a scanner generated by 
 * <a href="http://www.jflex.de/">JFlex</a> 1.4.3
 * on 5/11/15 5:12 PM from the specification file
 * <tt>exprArit.lex</tt>
 */
class Yylex implements java_cup.runtime.Scanner {

  /** This character denotes the end of file */
  public static final int YYEOF = -1;

  /** initial size of the lookahead buffer */
  private static final int ZZ_BUFFERSIZE = 16384;

  /** lexical states */
  public static final int YYINITIAL = 0;

  /**
   * ZZ_LEXSTATE[l] is the state in the DFA for the lexical state l
   * ZZ_LEXSTATE[l+1] is the state in the DFA for the lexical state l
   *                  at the beginning of a line
   * l is of the form l = 2*k, k a non negative integer
   */
  private static final int ZZ_LEXSTATE[] = { 
     0, 0
  };

  /** 
   * Translates characters to character classes
   */
  private static final String ZZ_CMAP_PACKED = 
    "\11\0\1\64\1\3\1\0\2\64\22\0\1\64\3\0\1\15\2\0"+
    "\1\51\1\6\1\7\1\2\1\56\1\10\1\55\1\0\1\1\12\63"+
    "\1\12\1\11\1\0\1\13\1\0\1\57\1\52\1\42\1\62\1\45"+
    "\1\50\1\44\1\41\1\46\6\62\1\61\1\62\1\47\1\62\1\43"+
    "\10\62\1\53\1\0\1\54\3\0\1\20\1\37\1\34\1\32\1\23"+
    "\1\40\1\16\1\36\1\24\2\62\1\26\1\21\1\25\1\27\1\31"+
    "\1\62\1\17\1\35\1\22\1\33\2\62\1\30\1\62\1\60\1\4"+
    "\1\14\1\5\uff82\0";

  /** 
   * Translates characters to character classes
   */
  private static final char [] ZZ_CMAP = zzUnpackCMap(ZZ_CMAP_PACKED);

  /** 
   * Translates DFA states to action switch labels.
   */
  private static final int [] ZZ_ACTION = zzUnpackAction();

  private static final String ZZ_ACTION_PACKED_0 =
    "\1\0\2\1\1\2\1\3\1\4\1\5\1\6\1\7"+
    "\1\10\1\11\1\1\1\12\1\13\1\14\16\15\1\16"+
    "\1\17\1\20\1\21\1\22\1\23\1\24\1\25\1\0"+
    "\1\26\21\27\1\30\1\0\21\27\1\31\25\27\1\32"+
    "\6\27\1\33\1\27\1\34\5\27\1\35\10\27\1\36"+
    "\1\37\1\27\1\40\1\27\1\41\5\27\1\42\5\27"+
    "\1\43\2\27\1\44\2\27\1\45\1\46\1\47\1\50"+
    "\3\27\1\51\2\27\1\52\1\53";

  private static int [] zzUnpackAction() {
    int [] result = new int[156];
    int offset = 0;
    offset = zzUnpackAction(ZZ_ACTION_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackAction(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }


  /** 
   * Translates a state to a row index in the transition table
   */
  private static final int [] ZZ_ROWMAP = zzUnpackRowMap();

  private static final String ZZ_ROWMAP_PACKED_0 =
    "\0\0\0\65\0\152\0\65\0\65\0\65\0\65\0\65"+
    "\0\65\0\65\0\65\0\237\0\65\0\65\0\65\0\324"+
    "\0\u0109\0\u013e\0\u0173\0\u01a8\0\u01dd\0\u0212\0\u0247\0\u027c"+
    "\0\u02b1\0\u02e6\0\u031b\0\u0350\0\u0385\0\65\0\65\0\65"+
    "\0\65\0\65\0\65\0\65\0\u03ba\0\u03ef\0\65\0\u0173"+
    "\0\u0424\0\u0459\0\u048e\0\u04c3\0\u04f8\0\u052d\0\u0562\0\u0597"+
    "\0\u05cc\0\u0601\0\u0636\0\u066b\0\u06a0\0\u06d5\0\u070a\0\u073f"+
    "\0\u03ba\0\u0774\0\u07a9\0\u07de\0\u0813\0\u0848\0\u087d\0\u08b2"+
    "\0\u08e7\0\u091c\0\u0951\0\u0986\0\u09bb\0\u09f0\0\u0a25\0\u0a5a"+
    "\0\u0a8f\0\u0ac4\0\u0af9\0\u03ef\0\u0b2e\0\u0b63\0\u0b98\0\u0bcd"+
    "\0\u0c02\0\u0c37\0\u0c6c\0\u0ca1\0\u0cd6\0\u0d0b\0\u0d40\0\u0d75"+
    "\0\u0daa\0\u0ddf\0\u0e14\0\u0e49\0\u0e7e\0\u0eb3\0\u0ee8\0\u0f1d"+
    "\0\u0f52\0\u0173\0\u0f87\0\u0fbc\0\u0ff1\0\u1026\0\u105b\0\u1090"+
    "\0\u0173\0\u10c5\0\u0173\0\u10fa\0\u112f\0\u1164\0\u1199\0\u11ce"+
    "\0\u0173\0\u1203\0\u1238\0\u126d\0\u12a2\0\u12d7\0\u130c\0\u1341"+
    "\0\u1376\0\u0173\0\u0173\0\u13ab\0\u0173\0\u13e0\0\u0173\0\u1415"+
    "\0\u144a\0\u147f\0\u14b4\0\u14e9\0\u0173\0\u151e\0\u1553\0\u1588"+
    "\0\u15bd\0\u15f2\0\u0173\0\u1627\0\u165c\0\u0173\0\u1691\0\u16c6"+
    "\0\u0173\0\u0173\0\u0173\0\u0173\0\u16fb\0\u1730\0\u1765\0\u0173"+
    "\0\u179a\0\u17cf\0\u0173\0\u0173";

  private static int [] zzUnpackRowMap() {
    int [] result = new int[156];
    int offset = 0;
    offset = zzUnpackRowMap(ZZ_ROWMAP_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackRowMap(String packed, int offset, int [] result) {
    int i = 0;  /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int high = packed.charAt(i++) << 16;
      result[j++] = high | packed.charAt(i++);
    }
    return j;
  }

  /** 
   * The transition table of the DFA
   */
  private static final int [] ZZ_TRANS = zzUnpackTrans();

  private static final String ZZ_TRANS_PACKED_0 =
    "\1\2\1\3\1\4\1\5\1\6\1\7\1\10\1\11"+
    "\1\12\1\13\1\14\1\15\1\16\1\17\1\20\1\21"+
    "\1\22\1\23\1\24\1\23\1\25\1\26\3\23\1\27"+
    "\2\23\1\30\1\31\2\23\1\32\1\33\1\23\1\34"+
    "\1\23\1\35\3\23\1\36\1\37\1\40\1\41\1\42"+
    "\1\43\1\44\3\23\1\45\1\5\67\0\1\46\75\0"+
    "\1\47\67\0\1\50\1\51\31\50\7\0\4\50\17\0"+
    "\5\50\1\52\25\50\7\0\4\50\17\0\10\50\1\53"+
    "\1\50\1\54\2\50\1\55\15\50\7\0\4\50\17\0"+
    "\33\50\7\0\4\50\17\0\1\50\1\56\3\50\1\57"+
    "\25\50\7\0\4\50\17\0\7\50\1\60\23\50\7\0"+
    "\4\50\17\0\11\50\1\61\21\50\7\0\4\50\17\0"+
    "\1\50\1\62\31\50\7\0\4\50\17\0\10\50\1\63"+
    "\22\50\7\0\4\50\17\0\4\50\1\64\26\50\7\0"+
    "\4\50\17\0\6\50\1\65\24\50\7\0\4\50\17\0"+
    "\24\50\1\66\6\50\7\0\4\50\17\0\26\50\1\67"+
    "\4\50\7\0\4\50\17\0\23\50\1\70\7\50\7\0"+
    "\4\50\17\0\33\71\7\0\4\71\1\0\2\46\1\72"+
    "\1\0\61\46\16\0\2\50\1\73\30\50\7\0\4\50"+
    "\17\0\1\74\15\50\1\75\14\50\7\0\4\50\17\0"+
    "\13\50\1\76\17\50\7\0\4\50\17\0\6\50\1\77"+
    "\24\50\7\0\4\50\17\0\4\50\1\100\26\50\7\0"+
    "\4\50\17\0\2\50\1\101\30\50\7\0\4\50\17\0"+
    "\1\50\1\102\31\50\7\0\4\50\17\0\6\50\1\103"+
    "\24\50\7\0\4\50\17\0\7\50\1\104\23\50\7\0"+
    "\4\50\17\0\11\50\1\105\21\50\7\0\4\50\17\0"+
    "\5\50\1\106\25\50\7\0\4\50\17\0\2\50\1\107"+
    "\30\50\7\0\4\50\17\0\7\50\1\110\23\50\7\0"+
    "\4\50\17\0\4\50\1\111\26\50\7\0\4\50\17\0"+
    "\4\50\1\112\26\50\7\0\4\50\17\0\30\50\1\113"+
    "\2\50\7\0\4\50\1\0\1\46\1\114\1\72\1\0"+
    "\61\46\16\0\3\50\1\115\27\50\7\0\4\50\17\0"+
    "\5\50\1\116\25\50\7\0\4\50\17\0\11\50\1\117"+
    "\21\50\7\0\4\50\17\0\20\50\1\120\12\50\7\0"+
    "\4\50\17\0\11\50\1\121\21\50\7\0\4\50\17\0"+
    "\11\50\1\122\21\50\7\0\4\50\17\0\7\50\1\123"+
    "\23\50\7\0\4\50\17\0\3\50\1\124\27\50\7\0"+
    "\4\50\17\0\4\50\1\125\26\50\7\0\4\50\17\0"+
    "\4\50\1\126\26\50\7\0\4\50\17\0\14\50\1\127"+
    "\16\50\7\0\4\50\17\0\2\50\1\130\30\50\7\0"+
    "\4\50\17\0\4\50\1\131\26\50\7\0\4\50\17\0"+
    "\2\50\1\132\30\50\7\0\4\50\17\0\11\50\1\133"+
    "\21\50\7\0\4\50\17\0\11\50\1\134\21\50\7\0"+
    "\4\50\17\0\4\50\1\135\26\50\7\0\4\50\17\0"+
    "\3\50\1\136\27\50\7\0\4\50\17\0\12\50\1\137"+
    "\20\50\7\0\4\50\17\0\1\140\32\50\7\0\4\50"+
    "\17\0\2\50\1\141\30\50\7\0\4\50\17\0\3\50"+
    "\1\142\27\50\7\0\4\50\17\0\3\50\1\143\27\50"+
    "\7\0\4\50\17\0\17\50\1\144\13\50\7\0\4\50"+
    "\17\0\6\50\1\145\24\50\7\0\4\50\17\0\6\50"+
    "\1\146\24\50\7\0\4\50\17\0\5\50\1\147\25\50"+
    "\7\0\4\50\17\0\15\50\1\150\15\50\7\0\4\50"+
    "\17\0\7\50\1\151\23\50\7\0\4\50\17\0\5\50"+
    "\1\152\25\50\7\0\4\50\17\0\10\50\1\153\22\50"+
    "\7\0\4\50\17\0\25\50\1\154\5\50\7\0\1\50"+
    "\1\155\2\50\17\0\23\50\1\156\7\50\7\0\4\50"+
    "\17\0\11\50\1\157\21\50\7\0\4\50\17\0\2\50"+
    "\1\160\30\50\7\0\4\50\17\0\13\50\1\161\17\50"+
    "\7\0\4\50\17\0\7\50\1\162\23\50\7\0\4\50"+
    "\17\0\21\50\1\163\11\50\7\0\4\50\17\0\2\50"+
    "\1\164\30\50\7\0\4\50\17\0\6\50\1\165\24\50"+
    "\7\0\4\50\17\0\7\50\1\166\23\50\7\0\4\50"+
    "\17\0\2\50\1\167\30\50\7\0\4\50\17\0\1\50"+
    "\1\170\31\50\7\0\4\50\17\0\16\50\1\171\14\50"+
    "\7\0\4\50\17\0\17\50\1\172\13\50\7\0\4\50"+
    "\17\0\26\50\1\173\4\50\7\0\4\50\17\0\32\50"+
    "\1\174\7\0\4\50\17\0\24\50\1\175\6\50\7\0"+
    "\4\50\17\0\31\50\1\176\1\50\7\0\4\50\17\0"+
    "\1\50\1\177\31\50\7\0\4\50\17\0\6\50\1\200"+
    "\24\50\7\0\4\50\17\0\5\50\1\201\25\50\7\0"+
    "\4\50\17\0\4\50\1\202\26\50\7\0\4\50\17\0"+
    "\4\50\1\203\26\50\7\0\4\50\17\0\2\50\1\204"+
    "\30\50\7\0\4\50\17\0\10\50\1\205\22\50\7\0"+
    "\4\50\17\0\3\50\1\206\27\50\7\0\4\50\17\0"+
    "\4\50\1\207\26\50\7\0\4\50\17\0\23\50\1\210"+
    "\7\50\7\0\4\50\17\0\32\50\1\211\7\0\4\50"+
    "\17\0\33\50\7\0\1\212\3\50\17\0\4\50\1\213"+
    "\26\50\7\0\4\50\17\0\11\50\1\214\21\50\7\0"+
    "\4\50\17\0\6\50\1\215\24\50\7\0\4\50\17\0"+
    "\10\50\1\216\22\50\7\0\4\50\17\0\6\50\1\217"+
    "\24\50\7\0\4\50\17\0\6\50\1\220\24\50\7\0"+
    "\4\50\17\0\24\50\1\221\6\50\7\0\4\50\17\0"+
    "\24\50\1\222\6\50\7\0\4\50\17\0\5\50\1\223"+
    "\25\50\7\0\4\50\17\0\7\50\1\224\23\50\7\0"+
    "\4\50\17\0\11\50\1\225\21\50\7\0\4\50\17\0"+
    "\7\50\1\226\23\50\7\0\4\50\17\0\11\50\1\227"+
    "\21\50\7\0\4\50\17\0\7\50\1\230\23\50\7\0"+
    "\4\50\17\0\2\50\1\231\30\50\7\0\4\50\17\0"+
    "\7\50\1\232\23\50\7\0\4\50\17\0\10\50\1\233"+
    "\22\50\7\0\4\50\17\0\17\50\1\234\13\50\7\0"+
    "\4\50\1\0";

  private static int [] zzUnpackTrans() {
    int [] result = new int[6148];
    int offset = 0;
    offset = zzUnpackTrans(ZZ_TRANS_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackTrans(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      value--;
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }


  /* error codes */
  private static final int ZZ_UNKNOWN_ERROR = 0;
  private static final int ZZ_NO_MATCH = 1;
  private static final int ZZ_PUSHBACK_2BIG = 2;

  /* error messages for the codes above */
  private static final String ZZ_ERROR_MSG[] = {
    "Unkown internal scanner error",
    "Error: could not match input",
    "Error: pushback value was too large"
  };

  /**
   * ZZ_ATTRIBUTE[aState] contains the attributes of state <code>aState</code>
   */
  private static final int [] ZZ_ATTRIBUTE = zzUnpackAttribute();

  private static final String ZZ_ATTRIBUTE_PACKED_0 =
    "\1\0\1\11\1\1\10\11\1\1\3\11\16\1\7\11"+
    "\1\1\1\0\1\11\22\1\1\0\142\1";

  private static int [] zzUnpackAttribute() {
    int [] result = new int[156];
    int offset = 0;
    offset = zzUnpackAttribute(ZZ_ATTRIBUTE_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackAttribute(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }

  /** the input device */
  private java.io.Reader zzReader;

  /** the current state of the DFA */
  private int zzState;

  /** the current lexical state */
  private int zzLexicalState = YYINITIAL;

  /** this buffer contains the current text to be matched and is
      the source of the yytext() string */
  private char zzBuffer[] = new char[ZZ_BUFFERSIZE];

  /** the textposition at the last accepting state */
  private int zzMarkedPos;

  /** the current text position in the buffer */
  private int zzCurrentPos;

  /** startRead marks the beginning of the yytext() string in the buffer */
  private int zzStartRead;

  /** endRead marks the last character in the buffer, that has been read
      from input */
  private int zzEndRead;

  /** number of newlines encountered up to the start of the matched text */
  private int yyline;

  /** the number of characters up to the start of the matched text */
  private int yychar;

  /**
   * the number of characters from the last newline up to the start of the 
   * matched text
   */
  private int yycolumn;

  /** 
   * zzAtBOL == true <=> the scanner is currently at the beginning of a line
   */
  private boolean zzAtBOL = true;

  /** zzAtEOF == true <=> the scanner is at the EOF */
  private boolean zzAtEOF;

  /** denotes if the user-EOF-code has already been executed */
  private boolean zzEOFDone;


  /**
   * Creates a new scanner
   * There is also a java.io.InputStream version of this constructor.
   *
   * @param   in  the java.io.Reader to read input from.
   */
  Yylex(java.io.Reader in) {
    this.zzReader = in;
  }

  /**
   * Creates a new scanner.
   * There is also java.io.Reader version of this constructor.
   *
   * @param   in  the java.io.Inputstream to read input from.
   */
  Yylex(java.io.InputStream in) {
    this(new java.io.InputStreamReader(in));
  }

  /** 
   * Unpacks the compressed character translation table.
   *
   * @param packed   the packed character translation table
   * @return         the unpacked character translation table
   */
  private static char [] zzUnpackCMap(String packed) {
    char [] map = new char[0x10000];
    int i = 0;  /* index in packed string  */
    int j = 0;  /* index in unpacked array */
    while (i < 146) {
      int  count = packed.charAt(i++);
      char value = packed.charAt(i++);
      do map[j++] = value; while (--count > 0);
    }
    return map;
  }


  /**
   * Refills the input buffer.
   *
   * @return      <code>false</code>, iff there was new input.
   * 
   * @exception   java.io.IOException  if any I/O-Error occurs
   */
  private boolean zzRefill() throws java.io.IOException {

    /* first: make room (if you can) */
    if (zzStartRead > 0) {
      System.arraycopy(zzBuffer, zzStartRead,
                       zzBuffer, 0,
                       zzEndRead-zzStartRead);

      /* translate stored positions */
      zzEndRead-= zzStartRead;
      zzCurrentPos-= zzStartRead;
      zzMarkedPos-= zzStartRead;
      zzStartRead = 0;
    }

    /* is the buffer big enough? */
    if (zzCurrentPos >= zzBuffer.length) {
      /* if not: blow it up */
      char newBuffer[] = new char[zzCurrentPos*2];
      System.arraycopy(zzBuffer, 0, newBuffer, 0, zzBuffer.length);
      zzBuffer = newBuffer;
    }

    /* finally: fill the buffer with new input */
    int numRead = zzReader.read(zzBuffer, zzEndRead,
                                            zzBuffer.length-zzEndRead);

    if (numRead > 0) {
      zzEndRead+= numRead;
      return false;
    }
    // unlikely but not impossible: read 0 characters, but not at end of stream    
    if (numRead == 0) {
      int c = zzReader.read();
      if (c == -1) {
        return true;
      } else {
        zzBuffer[zzEndRead++] = (char) c;
        return false;
      }     
    }

	// numRead < 0
    return true;
  }

    
  /**
   * Closes the input stream.
   */
  public final void yyclose() throws java.io.IOException {
    zzAtEOF = true;            /* indicate end of file */
    zzEndRead = zzStartRead;  /* invalidate buffer    */

    if (zzReader != null)
      zzReader.close();
  }


  /**
   * Resets the scanner to read from a new input stream.
   * Does not close the old reader.
   *
   * All internal variables are reset, the old input stream 
   * <b>cannot</b> be reused (internal buffer is discarded and lost).
   * Lexical state is set to <tt>ZZ_INITIAL</tt>.
   *
   * @param reader   the new input stream 
   */
  public final void yyreset(java.io.Reader reader) {
    zzReader = reader;
    zzAtBOL  = true;
    zzAtEOF  = false;
    zzEOFDone = false;
    zzEndRead = zzStartRead = 0;
    zzCurrentPos = zzMarkedPos = 0;
    yyline = yychar = yycolumn = 0;
    zzLexicalState = YYINITIAL;
  }


  /**
   * Returns the current lexical state.
   */
  public final int yystate() {
    return zzLexicalState;
  }


  /**
   * Enters a new lexical state
   *
   * @param newState the new lexical state
   */
  public final void yybegin(int newState) {
    zzLexicalState = newState;
  }


  /**
   * Returns the text matched by the current regular expression.
   */
  public final String yytext() {
    return new String( zzBuffer, zzStartRead, zzMarkedPos-zzStartRead );
  }


  /**
   * Returns the character at position <tt>pos</tt> from the 
   * matched text. 
   * 
   * It is equivalent to yytext().charAt(pos), but faster
   *
   * @param pos the position of the character to fetch. 
   *            A value from 0 to yylength()-1.
   *
   * @return the character at position pos
   */
  public final char yycharat(int pos) {
    return zzBuffer[zzStartRead+pos];
  }


  /**
   * Returns the length of the matched text region.
   */
  public final int yylength() {
    return zzMarkedPos-zzStartRead;
  }


  /**
   * Reports an error that occured while scanning.
   *
   * In a wellformed scanner (no or only correct usage of 
   * yypushback(int) and a match-all fallback rule) this method 
   * will only be called with things that "Can't Possibly Happen".
   * If this method is called, something is seriously wrong
   * (e.g. a JFlex bug producing a faulty scanner etc.).
   *
   * Usual syntax/scanner level error handling should be done
   * in error fallback rules.
   *
   * @param   errorCode  the code of the errormessage to display
   */
  private void zzScanError(int errorCode) {
    String message;
    try {
      message = ZZ_ERROR_MSG[errorCode];
    }
    catch (ArrayIndexOutOfBoundsException e) {
      message = ZZ_ERROR_MSG[ZZ_UNKNOWN_ERROR];
    }

    throw new Error(message);
  } 


  /**
   * Pushes the specified amount of characters back into the input stream.
   *
   * They will be read again by then next call of the scanning method
   *
   * @param number  the number of characters to be read again.
   *                This number must not be greater than yylength()!
   */
  public void yypushback(int number)  {
    if ( number > yylength() )
      zzScanError(ZZ_PUSHBACK_2BIG);

    zzMarkedPos -= number;
  }


  /**
   * Contains user EOF-code, which will be executed exactly once,
   * when the end of file is reached
   */
  private void zzDoEOF() throws java.io.IOException {
    if (!zzEOFDone) {
      zzEOFDone = true;
      yyclose();
    }
  }


  /**
   * Resumes scanning until the next regular expression is matched,
   * the end of input is encountered or an I/O-Error occurs.
   *
   * @return      the next token
   * @exception   java.io.IOException  if any I/O-Error occurs
   */
  public java_cup.runtime.Symbol next_token() throws java.io.IOException {
    int zzInput;
    int zzAction;

    // cached fields:
    int zzCurrentPosL;
    int zzMarkedPosL;
    int zzEndReadL = zzEndRead;
    char [] zzBufferL = zzBuffer;
    char [] zzCMapL = ZZ_CMAP;

    int [] zzTransL = ZZ_TRANS;
    int [] zzRowMapL = ZZ_ROWMAP;
    int [] zzAttrL = ZZ_ATTRIBUTE;

    while (true) {
      zzMarkedPosL = zzMarkedPos;

      zzAction = -1;

      zzCurrentPosL = zzCurrentPos = zzStartRead = zzMarkedPosL;
  
      zzState = ZZ_LEXSTATE[zzLexicalState];


      zzForAction: {
        while (true) {
    
          if (zzCurrentPosL < zzEndReadL)
            zzInput = zzBufferL[zzCurrentPosL++];
          else if (zzAtEOF) {
            zzInput = YYEOF;
            break zzForAction;
          }
          else {
            // store back cached positions
            zzCurrentPos  = zzCurrentPosL;
            zzMarkedPos   = zzMarkedPosL;
            boolean eof = zzRefill();
            // get translated positions and possibly new buffer
            zzCurrentPosL  = zzCurrentPos;
            zzMarkedPosL   = zzMarkedPos;
            zzBufferL      = zzBuffer;
            zzEndReadL     = zzEndRead;
            if (eof) {
              zzInput = YYEOF;
              break zzForAction;
            }
            else {
              zzInput = zzBufferL[zzCurrentPosL++];
            }
          }
          int zzNext = zzTransL[ zzRowMapL[zzState] + zzCMapL[zzInput] ];
          if (zzNext == -1) break zzForAction;
          zzState = zzNext;

          int zzAttributes = zzAttrL[zzState];
          if ( (zzAttributes & 1) == 1 ) {
            zzAction = zzState;
            zzMarkedPosL = zzCurrentPosL;
            if ( (zzAttributes & 8) == 8 ) break zzForAction;
          }

        }
      }

      // store back cached position
      zzMarkedPos = zzMarkedPosL;

      switch (zzAction < 0 ? zzAction : ZZ_ACTION[zzAction]) {
        case 10: 
          { return new Symbol(sym.IGUAL);
          }
        case 44: break;
        case 18: 
          { return new Symbol(sym.GUION);
          }
        case 45: break;
        case 21: 
          { return new Symbol(sym.CARACTER_NUMERO, new String(yytext()));
          }
        case 46: break;
        case 2: 
          { return new Symbol(sym.CLAUSURA);
          }
        case 47: break;
        case 33: 
          { return new Symbol(sym.GRAMATICA);
          }
        case 48: break;
        case 42: 
          { return new Symbol(sym.NO_TERMINAL);
          }
        case 49: break;
        case 5: 
          { return new Symbol(sym.CORCHETE_CERRADO);
          }
        case 50: break;
        case 40: 
          { return new Symbol(sym.AUTOMATA);
          }
        case 51: break;
        case 39: 
          { return new Symbol(sym.RECONOCER);
          }
        case 52: break;
        case 22: 
          { return new Symbol(sym.ASIGNADOR);
          }
        case 53: break;
        case 30: 
          { return new Symbol(sym.ESTADOS);
          }
        case 54: break;
        case 34: 
          { return new Symbol(sym.INICIAL);
          }
        case 55: break;
        case 4: 
          { return new Symbol(sym.CORCHETE_ABIERTO);
          }
        case 56: break;
        case 1: 
          { System.err.println("Caracter Ilegal: "+yytext());
          }
        case 57: break;
        case 17: 
          { return new Symbol(sym.P_CUADRADO_CERRADO);
          }
        case 58: break;
        case 12: 
          { return new Symbol(sym.PALABRA_VACIA);
          }
        case 59: break;
        case 15: 
          { return new Symbol(sym.LENGUAJE_VACIO);
          }
        case 60: break;
        case 3: 
          { /* ignora delimitadores */
          }
        case 61: break;
        case 19: 
          { return new Symbol(sym.CLAUSURA_POSITIVA);
          }
        case 62: break;
        case 16: 
          { return new Symbol(sym.P_CUADRADO_ABIERTO);
          }
        case 63: break;
        case 13: 
          { return new Symbol(sym.CARACTER, new String(yytext()));
          }
        case 64: break;
        case 36: 
          { return new Symbol(sym.TERMINAL);
          }
        case 65: break;
        case 43: 
          { return new Symbol(sym.PRODUCCION);
          }
        case 66: break;
        case 11: 
          { return new Symbol(sym.UNION);
          }
        case 67: break;
        case 31: 
          { return new Symbol(sym.FUN_FA_TO_RE);
          }
        case 68: break;
        case 23: 
          { return new Symbol(sym.IDENTIFICADOR, new String(yytext()));
          }
        case 69: break;
        case 20: 
          { return new Symbol(sym.INTERROGACION);
          }
        case 70: break;
        case 8: 
          { return new Symbol(sym.COMA);
          }
        case 71: break;
        case 37: 
          { return new Symbol(sym.FATONDFA);
          }
        case 72: break;
        case 38: 
          { return new Symbol(sym.FUN_CFG_TO_PDA);
          }
        case 73: break;
        case 9: 
          { return new Symbol(sym.PUNTO_Y_COMA);
          }
        case 74: break;
        case 26: 
          { return new Symbol(sym.AXIOMA);
          }
        case 75: break;
        case 7: 
          { return new Symbol(sym.PARENTESIS_CERRADO);
          }
        case 76: break;
        case 35: 
          { return new Symbol(sym.ALFABETO);
          }
        case 77: break;
        case 14: 
          { return new Symbol(sym.COMILLA);
          }
        case 78: break;
        case 41: 
          { return new Symbol(sym.TRANSICION);
          }
        case 79: break;
        case 32: 
          { return new Symbol(sym.RETOFA);
          }
        case 80: break;
        case 27: 
          { return new Symbol(sym.FUN_CLEAN);
          }
        case 81: break;
        case 6: 
          { return new Symbol(sym.PARENTESIS_ABIERTO);
          }
        case 82: break;
        case 29: 
          { return new Symbol(sym.EXPRESION_REGULAR);
          }
        case 83: break;
        case 28: 
          { return new Symbol(sym.FINAL);
          }
        case 84: break;
        case 24: 
          { return new Symbol(sym.CARACTERES_NUMEROS, new String(yytext()));
          }
        case 85: break;
        case 25: 
          { 
          }
        case 86: break;
        default: 
          if (zzInput == YYEOF && zzStartRead == zzCurrentPos) {
            zzAtEOF = true;
            zzDoEOF();
              { return new java_cup.runtime.Symbol(sym.EOF); }
          } 
          else {
            zzScanError(ZZ_NO_MATCH);
          }
      }
    }
  }


}
