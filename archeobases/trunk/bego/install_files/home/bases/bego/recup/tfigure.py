#! /usr/local/bin/python
#
# montbego - (c) 1999	   Jerome ALET <alet@unice.fr>
#		 1999-2000 Rachel VAUDRON <rachel@cleo.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
# $Id: tfigure.py,v 1.1.1.1 2000/11/06 08:33:18 jerome Exp $
#
# $Log: tfigure.py,v $
# Revision 1.1.1.1  2000/11/06 08:33:18  jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.3	2000/06/30 07:02:39  rachel
# modifs effectuees pdt un long laps de temps sans reseau ...
#
# Revision 1.2	2000/05/27 13:59:05  jerome
# Intégration du message de Log
#
#

import sys
import string

sys.path.append("../cgi")
import database

db = database.DataBase(database="bego", username = "bego")
lignes = sys.stdin.readlines()
l = 0
for ligne in lignes:
	ligne = string.strip(ligne[:-1])
	l = l + 1
	if (ligne != "") and (ligne[:12] != "fface_fclero") and (ligne[0] != "-")  :
		champs = string.split(ligne, ";")
		for i in range(0,len(champs)) :
			champs[i] = string.strip(champs[i])
		nouveaux = []
		nouveaux.append(champs[0]) #z
		nouveaux.append(champs[1]) #g
		if champs[2] in ["-","--","---"] : #r
			nouveaux.append(champs[3])
		else :
			nouveaux.append(champs[3]+champs[2])
		nouveaux.append(string.lower(champs[4])) #f

####################### FIGURE
		if champs[6] in ["-","--","---"] : #fg
			nouveaux.append(champs[5])
		else :
			nouveaux.append(champs[5]+champs[6])
####################### CARRE
		champs[7] = string.upper(champs[7])
		if champs[7] not  in ['CTI'] :
			nouveaux.append(champs[7]) #carre
		else :
			nouveaux.append('')

		nouveaux.append(string.capitalize(champs[14])) #identite
		nouveaux.append(string.upper(champs[8])) #style
		nouveaux.append(champs[12]) #longueur
		nouveaux.append(champs[13]) #largeur

####################### QUALITE
		champs[15] = string.upper(champs[15])
		if champs[15] in ['A','AA','AB','AI'] :
			nouveaux.append('AB')

		elif champs[15] in ['B'] :
			nouveaux.append('B')

		elif champs[15] in ['.M','M'] :
			nouveaux.append('M')

		elif champs[15] in ['MA'] :
			nouveaux.append('MA')
		else :
			nouveaux.append('')

####################### CONTOUR
		champs[16] = string.upper(champs[16])
		if champs[16] in ['IN','NI','NIR','NPR'] :
			nouveaux.append('NI')

		elif champs[16] in ['NR'] :
			nouveaux.append('NR')

		elif champs[16] in ['IP','IPN','PN','PNI'] :
			nouveaux.append('PNI')

		elif champs[16] in ['PNR'] :
			nouveaux.append('PNR')
		else :
			nouveaux.append('')

####################### PROFIL
		champs[17] = string.upper(champs[17])
		if champs[17] in ['A','AA','AAO','AI','AO','AOI','AOL','AOP','AOV','AP','APP','AR','AV','AVO','AZ','CER'] :
			nouveaux.append('A') #profil

		elif champs[17] in ['O','OA','OAV','OC','OI','OP','OPP','OV'] :
			nouveaux.append('O') #profil

		elif champs[17] in ['EQ','V','VA','VAO','VO','VOA'] :
			nouveaux.append('V') #profil
		else :
			nouveaux.append('')

####################### STRIE
		champs[24] = string.upper(champs[24])
		if champs[24] in ['D'] :
			nouveaux.append('D') #strie

		elif champs[24] in ['-','I'] :
			nouveaux.append('I') #strie

		elif champs[24] in ['N'] :
			nouveaux.append('N') #strie
		else :
			nouveaux.append('')

####################### SURFACE
		champs[18] = string.upper(champs[18])
		if champs[18] in ['API','IP','PAI','PI','PI*','PIU','PIW','PNI','PRI'] :
			nouveaux.append('PI')

		elif champs[18] in ['IPP','IPPP','OPPI','PIPP','PPI','PPIU','PPP','PPPI','PPPT','PPSI','PPTP','PPUI'] :
			nouveaux.append('PPI')

		elif champs[18] in ['APPR','PPPR','PP','PPA','PPAR','PPR*','PPR','PPR-','PPRE','PPRI','PPR'] :
			nouveaux.append('PPR')

		elif champs[18] in ['OPR','P','PA','PR-','PR','RP'] :
			nouveaux.append('PR')

		elif champs[18] in ['IS','SI','SPPI'] :
			nouveaux.append('SI')

		elif champs[18] in ['S','SR'] :
			nouveaux.append('SR')

		elif champs[18] in ['ATPI','ITPP','PTP','PTPI','TPI','TPP','TPPI','TPPR'] :
			nouveaux.append('TPI')

		elif champs[18] in ['PTPR','TP','TPN','TPR'] :
			nouveaux.append('TPR')
		else :
			nouveaux.append('')

####################### CUPULES DEBORDANTES/ BAVURE
		champs[23] = string.upper(champs[23])
		if champs[23] in ['B','E','O'] :
			nouveaux.append('O') # bavure

		elif champs[23] in ['-','0','A','I','N',''] :
			nouveaux.append('N') # bavure
		else :
			nouveaux.append('')

####################### PERIF
		champs[25] = string.upper(champs[25])
		if champs[25] in ['-','I','N','S',''] :
			nouveaux.append('I')

		elif champs[25] in ['D'] :
			nouveaux.append('D')
		else :
			nouveaux.append('')

####################### FORME
		champs[19] = string.upper(champs[19])
		if champs[19] in ['AAI','AI','AI-','AIA','AUI','IA'] :
			nouveaux.append('AI')

		elif champs[19] in ['AAL','AALI','AIAL','AIL','ALI','LAI'] :
			nouveaux.append('ALI')

		elif champs[19] in ['AALR','AL','ALAR','ALRI','ALR','LA'] :
			nouveaux.append('ALR')

		elif champs[19] in ['AALOI','AIO','ALIO','AOAI','AOALI','AOI','OIA','AOL','AOLI','AOPI','OAI'] :
			nouveaux.append('AOI')

		elif champs[19] in ['ALOR','AO','AOLR','AOR','ARO','OAL','OALI','OALR','OAR','ORA'] :
			nouveaux.append('AOR')

		elif champs[19] in ['A','AAR','AE','AP','AR','ARI','RA'] :
			nouveaux.append('AR')

		elif champs[19] in ['LI','RLI'] :
			nouveaux.append('LI')

		elif champs[19] in ['L','LR'] :
			nouveaux.append('LR')

		elif champs[19] in ['OI','OL','OLI','OUI','IO'] :
			nouveaux.append('OI')

		elif champs[19] in ['O','OLR','OPR','OR','OUOR','RO'] :
			nouveaux.append('OR')

		elif champs[19] in ['-','--','I','IP','IPP',''] :
			nouveaux.append('IND')
		else :
			nouveaux.append('')

####################### PROFONDEUR
		champs[20] = string.upper(champs[20])
		if champs in ['IP','IPN','PI','PI*','PIN','PIR','PPPI','PPPS','PPRP','PRI','PRS','PSI','SIP','SP','SPI','SPPP','SPR'] :
			nouveaux.append('PI')

		elif champs in ['IPP','IPPP','PPI','PPIP','PPIR','PPRI','PPRS','PPUI','PS','SIPP','SPP','SPPI','SRPP'] :
			nouveaux.append('PPI')

		elif champs in ['P','PA','PM','PPPR','PR','PRM','PSR','RP'] :
			nouveaux.append('PR')

		elif champs in ['PP','PPA','PPM','PPO','PPP','PPR','PPSR','RPP','SPPR'] :
			nouveaux.append('PPR')

		elif champs in ['IS','ISPP','PPIS','PPS','PPSI','RSPP','SDPP','SI','SJI'] :
			nouveaux.append('SI')

		elif champs in ['RS','S','SR','SR*','SRI','SSPR'] :
			nouveaux.append('SR')

		elif champs in ['TPI','ITP'] :
			nouveaux.append('TPI')

		elif champs in ['RTP','RTPP','TP','TPM'] :
			nouveaux.append('TPR')
		else :
			nouveaux.append('')

####################### TAILLE
		champs[21] =  string.upper(champs[21])
		if champs in ['G','GC','GI','GJ','GJC','GS','GSJ','TG'] :
			nouveaux.append('G')

		elif champs in ['M','M*','MC','MCX','MJC','MJG','MJU','MM','MR','MS','MSC','MSJ','N','RM'] :
			nouveaux.append('M')

		elif champs in ['P','PC','PI','PJ','PJC','PJR','PKJ','PP','PPI','PPP','PPR','PS','PSJ','PSQ','PT','PTP','RP'] :
			nouveaux.append('P')

		elif champs in ['RTP','TP','TPC','TPJ','TPS','TTP'] :
			nouveaux.append('TP')

		elif champs in ['GM','GMP','GPM','MG','MG*','MGC','MGI','MGJ','MGS','MJ','RMG'] :
			nouveaux.append('MG')

		elif champs in ['GP','PGM','PG','PMG'] :
			nouveaux.append('PG')

		elif champs in ['TPG'] :
			nouveaux.append('TPG')

		elif champs in ['-PM','MP','MPG','MPJ','PJM','PM','PM*','PMC','PMJ','PMS','PPM'] :
			nouveaux.append('PM')

		elif champs in ['TPM'] :
			nouveaux.append('TPM')

		elif champs in ['TPP'] :
			nouveaux.append('TPP')

		elif champs in ['-','--','I','ICE','IG','IJ','IM','IMG','IMS','IP','IPM','ITP',''] :
			nouveaux.append('IND')
		else :
			nouveaux.append('')

####################### DISPOSITION
		champs[22] = string.upper(champs[22])
		if champs in ['RS','RSR','S','SP','SR'] :
			nouveaux.append('SR')

		elif champs in ['J','JR','JPI','JRN','JV','MJR','PMJ','RJ'] :
			nouveaux.append('JR')

		elif champs in ['C','CCR','CR','CRI','RC'] :
			nouveaux.append('CR')

		elif champs in ['ER','E','RE'] :
			nouveaux.append('ER')

		elif champs in ['CE','EC','CER'] :
			nouveaux.append('CER')

		elif champs in ['SJR','JS','PSJ','RSJ','SJR','SJRI','SRJ'] :
			nouveaux.append('SJR')

		elif champs in ['RCS','RSC','SC','SCE','SCER','SCR','SRC'] :
			nouveaux.append('SCR')

		elif champs in ['SER','SERI'] :
			nouveaux.append('SER')

		elif champs in ['CJR','CRJ','JC','JCR','JCRI','RCJ','RJC'] :
			nouveaux.append('JCR')

		elif champs in ['EJ','JER'] :
			nouveaux.append('JER')

		elif champs in ['RSJC','SCRJ','SJC','SJCR','SJCRI'] :
			nouveaux.append('SJCR')

		elif champs in ['SJE','SJEP','SJER','SJREI'] :
			nouveaux.append('SJER')

		elif champs in ['CEJ','CJER','JCER','RCEJ'] :
			nouveaux.append('JCER')

		elif champs in ['SJCER'] :
			nouveaux.append('SJCER')

		elif champs in ['IS','SI','SLI','SRI','SSSSI'] :
			nouveaux.append('SI')

		elif champs in ['IJ','JI','MJI'] :
			nouveaux.append('JI')

		elif champs in ['CCI','CI','CI*','CSI','IC'] :
			nouveaux.append('CI')

		elif champs in ['IE','ESI','EI'] :
			nouveaux.append('EI')

		elif champs in ['CEI','CIE','CJE','ECI','ICE','IEC','CESI','SECI', 'SCEI'] :
			nouveaux.append('CEI')

		elif champs in ['JIS','JSI','SIJ','SJ','SJI','SJVI','SJJJI'] :
			nouveaux.append('SJI')

		elif champs in ['CIS','SCI'] :
			nouveaux.append('SCI')

		elif champs in ['SE','SEI','SEI*','SIE'] :
			nouveaux.append('SEI')

		elif champs in ['CIJ','CJ','CJI','ICG','IJC','JCCI','JCI','JIC'] :
			nouveaux.append('JCI')

		elif champs in ['EIJ','EJI','JE','JEI','JIE','JJEI'] :
			nouveaux.append('JEI')

		elif champs in ['JCSI','JISC','SCIJ','SCJI','SJCI','SJIC'] :
			nouveaux.append('SJCI')

		elif champs in ['SJEI','SJIE','SSJEI'] :
			nouveaux.append('SJEI')

		elif champs in ['CEIJ','CEJI','CJEI','CJIE','ECJI','JCCCE','JCE','JCEI','JCIE','JECI','JICE'] :
			nouveaux.append('JCEI')

		elif champs in ['SCEIJ','SCJEI','SECJI','SJCE','SJCEI'] :
			nouveaux.append('SJCEI')

		elif champs in ['-','--','I',''] :
			nouveaux.append('IND')

		else :
			nouveaux.append('')





############################### DESCRIPTION
		nouveaux.append(string.capitalize(champs[26])) #description

############################### CONTI

		if champs[7] in ['CTI'] :
			nouveaux.append('0')
		else :
			nouveaux.append('N')

#######################################################################################################################################

		for i in range(0, len(nouveaux)) :
			if i not in [0, 1, 8, 9] :
				nouveaux[i] = db.quote(nouveaux[i], "text")



		insert="INSERT INTO figure (zone, groupe,roche,face,figure, carre,identite,style,longueur,largeur, \
qualite,contour,profil,strie,surface,debord,perif,forme,profondeur,taille,disposition,description,conti) VALUES ("
		insert = insert + string.join(nouveaux, ', ')
		insert = insert + ");"

		print l, insert
		db.query(insert)

db.query("VACUUM;")








