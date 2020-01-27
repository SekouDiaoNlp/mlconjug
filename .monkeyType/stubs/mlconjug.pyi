from mlconjug3.PyVerbiste import VerbFr
from numpy import ndarray
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_selection.from_model import SelectFromModel
from sklearn.linear_model.stochastic_gradient import SGDClassifier
from typing import (
    Dict,
    List,
    Optional,
    Tuple,
    Union,
)


def extract_verb_features(verb: str, lang: str, ngram_range: Tuple[int, int]) -> List[str]: ...


class Conjugator:
    def __init__(self, language: str = ..., model: None = ...) -> None: ...
    def __repr__(self) -> str: ...
    def conjugate(self, verb: str, subject: str = ...) -> VerbFr: ...
    def set_model(self, model: Model) -> None: ...


class DataSet:
    def __init__(self, verbs_dict: Dict[str, Dict[str, str]]) -> None: ...
    def __repr__(self) -> str: ...
    def construct_dict_conjug(self) -> None: ...
    def split_data(self, threshold: int = ..., proportion: Union[int, float] = ...) -> None: ...


class Model:
    def __init__(
        self,
        vectorizer: Optional[CountVectorizer] = ...,
        feature_selector: Optional[SelectFromModel] = ...,
        classifier: Optional[SGDClassifier] = ...,
        language: None = ...
    ) -> None: ...
    def __repr__(self) -> str: ...
    def predict(self, verbs: List[str]) -> ndarray: ...
    def train(self, samples: List[str], labels: List[int]) -> None: ...
