/**Méthode vérifiant que le champ soit bien une date*/
function isDate(valeur){
   var re = /^\d{1}\d{1}\/\d{1}\d{1}\/\d{1}\d{1}\d{1}\d{1}$/;

   if(!re.test(valeur)){
        alert("Vous n'avez pas saisie une date !!!");
        return false;
   }
   return true;
}

/**Méthode vérifiant que le champ soitune adresse email*/
function isEmailAdress(valeur){
   var re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

   if(!re.test(valeur)){
        alert("Vous n'avez pas saisie une adresse email!!!");
        return false;
   }
   return true;
}

/**Méthode vérifiant que le champ ne soit pas vide*/
function isEmpty(valeur){
   var re = /^\S+$/;

   if(!re.test(valeur)){
        alert("Vous n'avez rien saisie !!!");
        return false;
   }
   return true;
}

/**Méthode vérifiant que le champ soit bien un fichier image*/
function isFile(valeur){
   var re = /^.+\.(gif|jpg|jpeg|png)$/i;

   if(!re.test(valeur)){
        alert("Vous n'avez saisie un fichier image !!!");
        return false;
   }
   return true;
}

/**Méthode vérifiant que la valeur saisie soit bien un entier*/
function isInteger(valeur){
   var re = /^\d+$/;
   
    if(!re.test(valeur)){
        alert("Vous n'avez pas saisie d'entier !!!");
        return false;
   }
   return true;
}

/**Méthode vérifiant que le champ soit bien un réel*/
function isReal(valeur){
   var re = /^\d+([\.|,])?\d+$/;

   if(!re.test(valeur)){
        alert("Vous n'avez pas saisie un réel !!!");
        return false;
   }
   return true;
}

