��    %      D  5   l      @  �   A    �  �     �   �  �   ]  �   >  �   �  �   �  �   �	  �   e
    7  �   V  r    �  �  �     x   �  .  4  a  c  6   �  5   �  6   2  9   i  7   �  6   �        +  �   8  �    �   �  &  �  H  �     .   l   K   -   �   2   �   G   !  �  a!  �   #  3  �#  �   �$  �   �%  �   y&  �   y'    +(    D)  �   [*  �   ;+  m  !,  �   �-  �  w.  �  60  �   2  �   �2  Q  B3  �  �4  >   s7  C   �7  <   �7  >   38  >   r8  <   �8  F  �8  ;  5:  �   q;    \<    j>  r  �?  �  �A     �D  j   �D  8   E  8   NE  @   �E                                                            !          
                     $            #   "       %                                           	                       
        Assigns the provided pre-trained scikit-learn model to be able to conjugate unknown verbs.

        :param model: scikit-learn Classifier or Pipeline.

         
        Gets conjugation information corresponding to the given template.

        :param template: string.
            Name of the verb ending pattern.
        :return: OrderedDict or None.
            OrderedDict containing the conjugated suffixes of the template.

         
        Gets verb information and returns a VerbInfo instance.

        :param verb: string.
            Verb to conjugate.
        :return: VerbInfo object or None.

         
        Load and parses the conjugations from xml file.

        :param conjugations_file: string or path object.
            Path to the conjugation xml file.

         
        Load and parses the inflected forms of the tense from xml file.

        :param tense: string.
            The current tense being processed.
        :return: list.
            List of conjugated suffixes.

         
        Load and parses the verbs from xml file.

        :param verbs_file: string or path object.
            Path to the verbs xml file.

         
        Parses XML file

        :param file: FileObject.
            XML file containing the conjugation templates
        :return: OrderedDict.
            An OrderedDict containing all the conjugation templates in the file.

         
        Parses XML file

        :param file: FileObject.
            XML file containing the verbs.
        :return: OrderedDict.
            An OrderedDict containing the verb and its template for all verbs in the file.

         
        Parses a verb and returns the ending ngrams.

        :param verb: string.
            Verb to vectorize.
        :return: list.
            Final ngrams of the verb.
         
        Predicts the conjugation class of the provided list of verbs.

        :param verbs: list.
            List of verbs.
        :return: list.
            List of predicted conjugation groups.

         
        Splits the data into a training and a testing set.

        :param threshold: int.
            Minimum size of conjugation class to be split.
        :param proportion: float.
            Proportion of samples in the training set.
            Must be between 0 and 1.

         
        Trains the model on the supplied samples and labels.

        :param samples: list.
            List of verbs.
        :param labels: list.
            List of verb templates.

         
        | Checks if the verb is a valid verb in the given language.
        | English words are always treated as possible verbs.
        | Verbs in other languages are filtered by their endings.

        :param verb: string.
            The verb conjugate.
        :return: bool.
            True if the verb is a valid verb in the language. False otherwise.

         
        | Detects the allowed endings for verbs in the supported languages.
        | All the supported languages except for English restrict the form a verb can take.
        | As English is much more productive and varied in the morphology of its verbs, any word is allowed as a verb.

        :return: set.
            A set containing the allowed endings of verbs in the target language.

         
        | Populates the dictionary containing the conjugation templates.
        | Populates the lists containing the verbs and their templates.

         
        | Populates the inflected forms of the verb.
        | Adds personal pronouns to the inflected verbs.

         
        | Populates the inflected forms of the verb.
        | This is the generic version of this method.
        | It does not add personal pronouns to the conjugated forms.
        | This method can handle any new language if the conjugation structure conforms to the Verbiste XML Schema.

         
        | This is the main method of this class.
        | It first checks to see if the verb is in Verbiste.
        | If it is not, and a pre-trained scikit-learn model has been supplied, the method then calls the model
        to predict the conjugation class of the provided verb.

        | Returns a Verb object or None.

        :param verb: string.
            Verb to conjugate.
        :param subject: string.
            Toggles abbreviated or full pronouns.
            The default value is 'abbrev'.
            Select 'pronoun' for full pronouns.
        :return: Verb object or None.

         
    This class defines the English Verb Object.

     
    This class defines the French Verb Object.

     
    This class defines the Italian Verb Object.

     
    This class defines the Portuguese Verb Object.

     
    This class defines the Romanian Verb Object.

     
    This class defines the Spanish Verb Object.

     
    This class defines the Verb Object.

    :param verb_info: VerbInfo Object.
    :param conjug_info: OrderedDict.
    :param subject: string.
        Toggles abbreviated or full pronouns.
        The default value is 'abbrev'.
        Select 'pronoun' for full pronouns.

     
    This class defines the Verbiste verb information structure.

    :param infinitive: string.
        Infinitive form of the verb.
    :param root: string.
        Lexical root of the verb.
    :param template: string.
        Name of the verb ending pattern.

     
    This is the class handling the Verbiste xml files.

    :param language: string.
    | The language of the conjugator. The default value is fr for French.
    | The allowed values are: fr, en, es, it, pt, ro.

     
    | Custom Vectorizer optimized for extracting verbs features.
    | The Vectorizer subclasses sklearn.feature_extraction.text.CountVectorizer .
    | As in Indo-European languages verbs are inflected by adding a morphological suffix,
    the vectorizer extracts verb endings and produces a vector representation of the verb with binary features.

    | The features are the verb ending ngrams. (ngram_range is set at class instanciation).

     
    | This class holds and manages the data set.
    | Defines helper functions for managing Machine Learning tasks like constructing a training and testing set.

    :param VerbisteObj:
        Instance of a Verbiste object.

     
    | This class manages the scikit-learn model.
    | The Pipeline includes a feature vectorizer, a feature selector and a classifier.
    | If any of the vectorizer, feature selector or classifier is not supplied at instance declaration,
    the __init__ method will provide good default values that get more than 92% prediction accuracy.

    :param vectorizer: scikit-learn Vectorizer.
    :param feature_selector: scikit-learn Classifier with a fit_transform() method
    :param classifier: scikit-learn Classifier with a predict() method

     
    | This is the main class of the project.
    | The class manages the Verbiste data set and provides an interface with the scikit-learn model.
    | If no parameters are provided, the default language is set to french and the pre-trained french conjugation model is used.
    | The class defines the method conjugate(verb, language) which is the main method of the module.

    :param language: string.
        Language of the conjugator. The default language is 'fr' for french.
    :param model: string.
        A user provided model if the user has trained his own model.

     Console script for mlconjug. The language for the conjugation model. The values can be fr, en, es, it, pt or ro. The default value is fr. The split proportion must be between 0 and 1. The supplied word: {0} is not a valid verb in {1}. Unsupported language.
The allowed languages are fr, en, es, it, pt, ro. Project-Id-Version: 
POT-Creation-Date: 2018-06-15 21:51+0200
PO-Revision-Date: 2018-06-16 18:34+0200
Language-Team: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Generated-By: pygettext.py 1.5
X-Generator: Poedit 2.0.8
Last-Translator: SekouD <sekoud.python@gmail.com>
Plural-Forms: nplurals=3; plural=(n==1 ? 0 : (n==0 || (n%100 > 0 && n%100 < 20)) ? 1 : 2);
Language: ro
 
        Atribuie modelul Scikit-Learn pre-instruit furnizat pentru a putea conjuga verbe necunoscute.

        :param model: scikit-learn Classifier or Pipeline.

         
        Obține informații de conjugare corespunzătoare șablonului dat.

        :param template: string.
            Numele modelului de terminare a verbului.
        :return: OrderedDict or None.
            OrdonatDict conținând sufixele conjugate ale șablonului.

         
        Obține informații verbale și returnează o instanță VerbInfo.

        :param verb: string.
            Verbul să se conjugă.
        :return: VerbInfo object or None.

         
        Încarcă și analizează conjugările din fișierul xml.

        :param conjugations_file: string or path object.
            Calea spre fișierul xml de conjugare.

        
        Încarcă și analizează formele inflexionate ale timpului din fișierul xml.

        :param tense: string.
            Timpul curent este procesat.
        :return: list.
            Lista sufixelor conjugate.

         
        Încărcați și parse verbele din fișierul xml.

        :param verbs_file: string or path object.
            Calea spre fișierul xml verbale.

         
        Parsează fișierul XML

        :param file: FileObject.
            Fișier XML care conține șabloanele de conjugare
        :return: OrderedDict.
            Un ordin ordonat care conține toate șabloanele de conjugare din fișier.

         
        Parsează fișierul XML

        :param file: FileObject.
            Fișier XML care conține verbele.
        :return: OrderedDict.
            Un ordin ordonat conținând verbul și șablonul său pentru toate verbele din fișier.

         
        Parsează un verb și returnează ngramurile terminate.

        :param verb: string.
            Verb să vectorizeze.
        :return: list.
           N-grams finale ale verbului.
         
        Prezice clasa de conjugare a listei furnizate de verbe.

        :param verbs: list.
            Lista verbelor.
        :return: list.
            Lista grupurilor de conjugare prezise.

         
        Împărțiți datele într-un antrenament și un set de testare.

        :param threshold: int.
            Dimensiunea minimă a clasei de conjugare care trebuie divizată.
        :param proportion: float.
            Proporția probelor din setul de antrenament.
            Trebuie să fie între 0 și 1.

         
        Formează modelul pe eșantioanele și etichetele furnizate.

        :param samples: list.
            Lista verbelor.
        :param labels: list.
            Lista șabloanelor de verb.

         
        | Verifică dacă verbul este un verb valabil în limba dată.
        | Cuvintele în limba engleză sunt tratate întotdeauna ca verbe posibile.
        | Verbe în alte limbi sunt filtrate după terminările lor.

        :param verb: string.
            Verbul conjugat.
        :return: bool.
            Adevărat dacă verbul este un verb valabil în limba respectivă. Fals altfel.

         
        | Detectează terminațiile permise pentru verbe în limbile acceptate.
        | Toate limbile acceptate, cu excepția limbii engleze, restricționează forma pe care o poate lua un verb.
        | Deoarece limba engleză este mult mai productivă și variată în morfologia verbelor sale, orice cuvânt este permis ca verb.

        :return: set.
            Un set care conține terminalele permise ale verbelor în limba țintă.

         
        | Populează dicționarul care conține șabloanele de conjugare.
        | Folosește listele care conțin verbele și șabloanele lor.

         
        | Populează formele inflamate ale verbului.
        | Adaugă pronume personale la verbele inflaționate.

         
        | Populează formele inflamate ale verbului.
        | Aceasta este versiunea generică a acestei metode.
        | Nu adaugă pronume personale forțelor conjugate.
        | Această metodă poate gestiona orice limbă nouă dacă structura de conjugare este conformă cu Schema XML Verbiste.

         
        | Aceasta este principala metodă a acestei clase.
        | Mai întâi verifică dacă verbul este în Verbiste.
        | Dacă nu este, și a fost furnizat un model Scikit-Learning pre-instruit, metoda îl sună apoi pe model
        pentru a prezice clasa de conjugare a verbului furnizat.

        | Returnează un obiect Verb sau None.

        :param verb: string.
            Verbul să se conjugă.
        :param subject: string.
            Comută denumiri abstracte sau complete.
            Valoarea implicită este "abbrev".
            Selectați "pronume" pentru pronume complet.
        :return: Verb object or None.

         
    Această clasă definește Obiectul englez de Verb.

     
    Această clasă definește Obiectul de Verb franțuzesc.

     
    Această clasă definește Obiectul Verb italian.

     
    Această clasă definește Obiectul Verb portughez.

     
    Această clasă definește Obiectul Verb românesc.

     
    Această clasă definește Obiectul Verb spaniol.

     
    Această clasă definește obiectul Verb.

    :param verb_info: VerbInfo Object.
    :param conjug_info: OrderedDict.
    :param subject: string.
        Comută denumiri abstracte sau complete.
        Valoarea implicită este "abbrev".
        Selectați "pronume" pentru pronume complet.

     
    Această clasă definește structura informațională a Verbiste.

    :param infinitive: string.
        Forma infinitivă a verbului.
    :param root: string.
        Rădăcina lexicală a verbului.
    :param template: string.
        Numele modelului de terminare a verbului.

     
    Aceasta este clasa care manipulează fișierele xml Verbiste.

    :param language: string.
    | Limba conjugatorului. Valoarea implicită este fr pentru franceză.
    | Valorile admise sunt: fr, en, es, it, pt, ro.

     
    | Custom Vectorizer optimizat pentru extragerea caracteristicilor verbelor.
    | Subclasele Vectorizer sklearn.feature_extraction.text.CountVectorizer.
    | Ca și în limbile indo-europene, verbele sunt influențate prin adăugarea unui sufix morfologic,
    vectorizatorul extrage terminațiile verbului și produce o reprezentare vectorială a verbului cu caracteristici binare.

    | Caracteristicile sunt verbul care sfârșește ngrams. (ngram_range este setat la instanciation de clasă).

     
    | Această clasă deține și gestionează setul de date.
    | Definește funcțiile de ajutor pentru gestionarea sarcinilor Machine Learning precum construirea unui set de instruire și testare.

    :param VerbisteObj:
        Instanța unui obiect Verbiste .

     
    | Această clasă gestionează modelul scikit-learn.
    | Conducta include un vectorizator de caracteristici, un selector de caracteristici și un clasificator.
    | Dacă oricare dintre vectorizatorul, selectorul de caracteristici sau clasificatorul nu este furnizat la declarația instanței,
    metoda __init__ va furniza valori implicite bune care obțin o precizie de predicție de peste 92%.

    :param vectorizer: scikit-learn Vectorizer.
    :param feature_selector: scikit-learn Classifier with a fit_transform() method
    :param classifier: scikit-learn Classifier with a predict() method

     
    | Aceasta este clasa principală a proiectului.
    | Clasa gestionează setul de date Verbiste și oferă o interfață cu modelul scikit-learn.
    | Dacă nu sunt furnizați parametri, limba implicită este setată la limba franceză și se folosește modelul de conjugare franceză pre-instruit.
    | Clasa definește metoda conjugate (verb, limbă) care este principala metodă a modulului.

    :param language: string.
        Limba conjugatorului. Limba implicită este "fr" pentru franceză.
    :param model: string.
        Model furnizat de utilizator dacă utilizatorul și-a pregătit propriul model.

     Consola script pentru mlconjug. Limba pentru modelul de conjugare. Valorile pot fi fr, en, es, it, pt sau ro. Valoarea implicită este fr. Proporția împărțită trebuie să fie între 0 și 1. Cuvântul furnizat: {0} nu este un verb valabil în {1}. Limba neacceptată.
Limbile permise sunt fr, en, es, it, pt, ro. 