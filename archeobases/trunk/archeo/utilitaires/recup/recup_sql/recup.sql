select  zone,numero,bis,locus,couche,nature,sol,x,y,zrela,zref,zabs,orient,pend,dirpend,long,lar,ep,trouve,ensemble,niveau,carre,sscarre  from robjet into '/home/isernia/sauve/robjet.txt'/

select ffidfaun_fozone,ffidfaun_fonumero,ffidfaun_fobis,long,larg,ep,poids,oss,ordre,famille,sfamille,genre,espece,sespece,typos1,typos2,typos3,typos4,typos5,typos6,latera,fragment,section,type,couleur,sexe,aspect,fissure,trace,concretion,tissu,datation,biochemie,photo,dessin,age,decapage,restauration,oxyde,associe,taille,pathologie,moulage,conservation,color,classe 
from rfaune
into '/home/isernia/sauve/rfaune.txt'/

select fmmesure_ffidfaun_fozone,fmmesure_ffidfaun_fonumero,fmmesure_ffidfaun_fobis,serie,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,m20,m21,m22,m23,m24,m25 
from rmesure
into '/home/isernia/sauve/rmesure.txt'/

select dfobjet_ffidfaun_fozone,dfobjet_ffidfaun_fonumero,dfobjet_ffidfaun_fobis,serie,type,mesure1,mesure2,mesure3,mesure4,mesure5,mesure6,mesure7,mesure8,mesure9,mesure10 
from rmdent
into '/home/isernia/sauve/rmdent.txt'/

select ftobjet_ffidfaun_fozone,ftobjet_ffidfaun_fonumero,ftobjet_ffidfaun_fobis,ensemble,nature,origine,localisation,position,nombre,long,classe,largeur,profondeur,allure,locmuscle,direction,sens,dessin,replique 
from rtrace
into '/home/isernia/sauve/rtrace.txt'/

select micobjet_ffidfaun_fozone,micobjet_ffidfaun_fonumero,micobjet_ffidfaun_fobis,micserie,mictype,micm1,micm2,micm3,micm4,micm5,micm6,micm7,micm8,micm9,micm10,micm11,micm12,micm13,micm14,micm15,micm16,micm17,micm18,micm19,micm20,micm21,micm22,micm23,micm24,micm25 
from rmicro
into '/home/isernia/sauve/rmicro.text'/

select fidobj_ffidfaun_fozone,fidobj_ffidfaun_fonumero,fidobj_ffidfaun_fobis,ordre,individu,type,faobjet_ffidfaun_fozone,faobjet_ffidfaun_fonumero,faobjet_ffidfaun_fobis 
from rassocie
into '/home/isernia/sauve/rassocie.txt'/



select fidouti_fozone,fidouti_fonumero,fidouti_fobis,figure,numer,Oa,Ob,Oc,poids,nature,forme,L,l,e,debitage,type,section,contour,enlevement,talon,bulbe,cone,onde,epi,strie,principale,secondaire,charniere,carene,patine,dpatine,alteration,desilic,encroute,action,eolisation,lustrage,roule 
from routil
into '/home/isernia/sauve/routil.txt'/


select ridoutil_fidouti_fozone,ridoutil_fidouti_fonumero,ridoutil_fidouti_fobis,ordre,type,obliq,dent,cp,dim,associat,superp,extrem,bord,long,frequ,ecras,lustr,biseau,strie,origine,destination,sens,support,tranchant 
from rretouch
into '/home/isernia/sauve/rretouch.txt'/

select fobjet_fidouti_fozone,fobjet_fidouti_fonumero,fobjet_fidouti_fobis,ordre,composite,type,percussion,mode,support,tranchant,anciente,num 
from rfractur
into '/home/isernia/sauve/rfractur.txt'/

select sobjet_fidouti_fozone,sobjet_fidouti_fonumero,sobjet_fidouti_fobis,number,type,local,situat 
from rstigmat
into '/home/isernia/sauve/stigmat.txt'/

OU
select * from rstigmat into '/home/isernia/sauve.stigmat.txt'/
select * from rstigma2 into '/home/isernia/sauve.stigma2.txt'/

select soutil_fidouti_fozone,soutil_fidouti_fonumero,soutil_fidouti_fobis,ordre,composite,code,forme,orientation,retouche,etat,origine,destination,sens,support,tranchant,sa,sb,sc,sd,se,sf,sg,sh 
from rsimple
into '/home/isernia/sauve/rsimple.txt'/


select eoutil_fidouti_fozone,eoutil_fidouti_fonumero,eoutil_fidouti_fobis,code,support,tranchant
from rextremi
into '/home/isernia/sauve/rextremi.txt'/

select goutil_fidouti_fozone,goutil_fidouti_fonumero,goutil_fidouti_fobis,ordre,composite,type,fact,qual,A,B,P,element,forme,arete,orient,long,profil,profond,obliq,extrem,proem,ret,sens,support,tranchant,sit,epais,lon,lar,oblique,corde,fleche,ptimp,frappe,franumero,inclinaison,direction 
from rgalet
into '/home/isernia/sauve/rgalet.txt'/


select ffnuc_fidouti_fozone,ffnuc_fidouti_fonumero,ffnuc_fidouti_fobis,cortotal,corfaceA,corfaceB,dirtotal,dirfaceA,dirfaceB,formule 
from rnucleus
into '/home/isernia/sauve/rnucleus.txt'/

select coutil_fidouti_fozone,coutil_fidouti_fonumero,coutil_fidouti_fobis,ordre,type,code,niveau,debut,fin  
from rcompos
into '/home/isernia/sauve/rcompos.txt'/

select fdimens_fidouti_fozone,fdimens_fidouti_fonumero,fdimens_fidouti_fobis,Lm,lm,fa,fb,fc,fd,fe,ff,ta,tb,tc,td,te,tf,ti,tg,thc
 from rdimens
into '/home/isernia/sauve/rdimens.txt'/

select gidim_fidouti_fozone,gidim_fidouti_fonumero,gidim_fidouti_fobis,ordre,cha,chb,chc,chd,che,chde,gchf,chg,chh,chi,chj,chk,chna,chnb,chl,chm,cho,chp,chq,chqq,chr,chrg,chrd,chrr,chs,cht,chu,chw1,chw2,chv1,chv2,chv3,chx,chxx,chy,chyy,chx1,chx2,chx3,chx4
from rdimens2
into '/home/isernia/sauve/rdimens2.txt'/

select frtrace_ftobjet_ffidfaun_fozone,frtrace_ftobjet_ffidfaun_fonumero,frtrace_ftobjet_ffidfaun_fobis,frtrace_ftensemb,numero,type,ensemble 
from rfrelat
into '/home/isernia/sauve/rfrelat.txt'/


