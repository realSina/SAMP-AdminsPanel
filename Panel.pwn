/*
      [=========================================================================================]
                                Admins Panel by Sina
                                Instagram ID: http://instagram.com/xrealsina/
                                Telegram ID: http://t.me/realSina/
                                GitHub: https://github.com/realSina/
      [=========================================================================================]


*/
#include <a_samp> //Main include
#pragma tabsize 0 // warning 217: loose indentation FIXED WITH THIS LINE
#define	strcpy(%0,%1,%2) strcat((%0[0] = '\0', %0), %1, %2)
#define Message SendClientMessage
#define COLOR_RED 0xFF0000FF // Red color defined
#define COLOR_GREEN 0x00FF00FF // Green color defined
#define COLOR_WHITE 0xFFFFFFFF // White color defined
#define COLOR_USAGE 0x5D7E8D77 // Usage color defined

// Start new
    new ServerName[MAX_PLAYERS][128];
    new ServerPassword[MAX_PLAYERS][128];
    new BanIP[MAX_PLAYERS][128];
    new Say[MAX_PLAYERS][128];
    new Gamemodetext[MAX_PLAYERS][128];
    new Language[MAX_PLAYERS][128];
    new Custom[MAX_PLAYERS][128];

    new WantName[MAX_PLAYERS];
    new WantPass[MAX_PLAYERS];
    new WantGMX[MAX_PLAYERS];
    new WantSay[MAX_PLAYERS];
    new WantBanIP[MAX_PLAYERS];
    new WantGMText[MAX_PLAYERS];
    new WantLang[MAX_PLAYERS];
    new WantUnBanIP[MAX_PLAYERS];
    new WantCustom[MAX_PLAYERS];
// End

public OnFilterScriptInit()
{
	print("\n------------------------------------------");
	print(" Server control panel for admins ");
	print(" MADE BY SINA ");
	print(" Telegram ID: http://t.me/realSina/ ");
	print(" Instagram ID: http://instagram.com/xrealsina/ ");
	print(" GitHub: https://github.com/realSina/ ");
	print("--------------------------------------------\n");
	return 1;
}
// Publics
public OnPlayerConnect(playerid)
{
    WantName[playerid] = 0;
	WantPass[playerid] = 0;
	WantGMX[playerid] = 0;
	WantSay[playerid] = 0;
	WantUnBanIP[playerid] = 0;
	WantBanIP[playerid] = 0;
	WantGMText[playerid] = 0;
	WantLang[playerid] = 0;
	WantCustom[playerid] = 0;
	return 1;
}
public OnPlayerDisconnect(playerid)
{
	
	WantName[playerid] = 0;
	WantPass[playerid] = 0;
	WantGMX[playerid] = 0;
	WantSay[playerid] = 0;
	WantUnBanIP[playerid] = 0;
	WantBanIP[playerid] = 0;
	WantGMText[playerid] = 0;
	WantLang[playerid] = 0;
	WantCustom[playerid] = 0;

	return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 267)
	{
		if(response)
		{
			new googool[144];
			format(googool, sizeof(googool), "The server name was changed to:{ff0000} %s", ServerName[playerid]);
            Message(playerid, COLOR_WHITE, googool);
		}
	}
	if(dialogid == 268)
	{
		if(response)
		{
			if(!strcmp(ServerPassword[playerid],"0",true))
			{
            Message(playerid, COLOR_WHITE, "The server password was removed.");
            return 1;
            }
            new googool[144];
			format(googool, sizeof(googool), "The server password was changed to:{ff0000} %s", ServerPassword[playerid]);
            Message(playerid, COLOR_WHITE, googool);
		}
	}
	if(dialogid == 270)
	{
		if(response)
		{
			new googool[144];
			format(googool, sizeof(googool), "IP{ff0000} %s{ffffff} was banned", BanIP[playerid]);
            Message(playerid, COLOR_WHITE, googool);
		}
	}
	if(dialogid == 271)
	{
		if(response)
		{
			new googool[144];
			format(googool, sizeof(googool), "IP{ff0000} %s{ffffff} was unbanned", BanIP[playerid]);
            Message(playerid, COLOR_WHITE, googool);
		}
	}
	if(dialogid == 272)
	{
		if(response)
		{
			new googool[144];
			format(googool, sizeof(googool), "Said:{ff0000} %s", Say[playerid]);
            Message(playerid, COLOR_WHITE, googool);
		}
	}
	if(dialogid == 273)
	{
		if(response)
		{
			new googool[144];
			format(googool, sizeof(googool), "Gamemodetext was set to:{ff0000} %s", Gamemodetext[playerid]);
            Message(playerid, COLOR_WHITE, googool);
		}
	}
	if(dialogid == 274)
	{
		if(response)
		{
			new googool[144];
			format(googool, sizeof(googool), "Gamemode language was set to:{ff0000} %s", Language[playerid]);
            Message(playerid, COLOR_WHITE, googool);
		}
	}
	if(dialogid == 279)
	{
		if(response)
		{
			new googool[144];
			format(googool, sizeof(googool), "You have used{ff0000} %s{ffffff} with custom section in panel.", Custom[playerid]);
            Message(playerid, COLOR_WHITE, googool);
		}
	}
	if(dialogid == 312)
    {
        if(response)
        {
        	if(listitem == 0)
            {
			ShowPlayerDialog(playerid, 313,DIALOG_STYLE_INPUT, "Panel", "Enter the new server name below:", "Done", "Back");
			}
        	if(listitem == 1)
            {
			ShowPlayerDialog(playerid, 314,DIALOG_STYLE_INPUT, "Panel", "Enter the new server password below:", "Done", "Back");
			}
        	if(listitem == 2)
            {
			ShowPlayerDialog(playerid, 315,DIALOG_STYLE_MSGBOX, "Panel", "Are you sure you want to restart the server? The server will restart in 2 seconds when you click YES", "YES", "NO");
			}
        	if(listitem == 3)
            {
			ShowPlayerDialog(playerid, 316,DIALOG_STYLE_INPUT, "Panel", "Enter the ip address to unban below:", "Done", "Back");
			}
        	if(listitem == 4)
            {
			ShowPlayerDialog(playerid, 317,DIALOG_STYLE_INPUT, "Panel", "Enter the ip address to ban below:", "Done", "Back");
			}
        	if(listitem == 5)
            {
			ShowPlayerDialog(playerid, 318,DIALOG_STYLE_INPUT, "Panel", "Enter whatever you want to say below:", "Done", "Back");
			}
        	if(listitem == 6)
            {
			ShowPlayerDialog(playerid, 319,DIALOG_STYLE_INPUT, "Panel", "Enter whatever you want to set gamemodetext below:", "Done", "Back");
			}
        	if(listitem == 7)
            {
			ShowPlayerDialog(playerid, 320,DIALOG_STYLE_INPUT, "Panel", "Enter whatever you want to set gamemode language below:", "Done", "Back");
			}
			if(listitem == 8)
			{
			ShowPlayerDialog(playerid, 321,DIALOG_STYLE_INPUT, "Panel", "Enter whatever you want of RCONs below:", "Done", "Back");
			}
        }
    }
	if(dialogid == 313)
    {
        if(response)
        {
        	new length = strlen(inputtext);
        	if(length==0)
        	{
        	ShowPlayerDialog(playerid, 313,DIALOG_STYLE_INPUT, "Panel", "{FF0000}Please fill this box.\n{A9C4E4}Enter the new server name below:", "Done", "Back");
        	return 1;
        	}
        	WantName[playerid] = 1;
            new string[128];
            format(string,sizeof(string),"hostname %s", inputtext);
            SendRconCommand(string);
            strcpy(ServerName[playerid],inputtext,128);
            new Dialog[1024];
            format(Dialog, sizeof(Dialog), "You have{FF0000} changed{A9C4E4} the server name to:\n{FF0000} %s{A9C4E4}.", inputtext);
            ShowPlayerDialog(playerid, 267, DIALOG_STYLE_MSGBOX,"Panel", Dialog,"Done", "");
            WantName[playerid] = 0;
        }
        else
        {
            new panel[1024];
		    format(panel,sizeof(panel),"Server Name \t\nServer Password\t\nRestart Server \t\nUnBanIP \t\nBanIP \t\nSay \t\nGameModeText \t\nGameModeLanguage \t\nCustom");
		    ShowPlayerDialog(playerid,312,DIALOG_STYLE_LIST,"Panel",panel,"Select","Cancel");
        }
    }
	if(dialogid == 314)
    {
        if(response)
        {
        	new length = strlen(inputtext);
        	if(length==0)
        	{
        		ShowPlayerDialog(playerid, 314,DIALOG_STYLE_INPUT, "Panel", "{FF0000}Please fill this box. (For remove server password, enter 0)\n{A9C4E4}Enter the new server password below:", "Done", "Back");
        	return 1;
        	}
        	if(!strcmp(inputtext,"0",true))
			{
	        new DG[1024];
            format(DG, sizeof(DG), "You have{FF0000} removed{A9C4E4} the server password.", inputtext);
            ShowPlayerDialog(playerid, 268, DIALOG_STYLE_MSGBOX,"Panel", DG,"Done", "");
            new pass[128];
            format(pass,sizeof(pass),"password %s", inputtext);
            SendRconCommand(pass);
            strcpy(ServerPassword[playerid],inputtext,128);
            return 1;
            }
        	WantPass[playerid] = 1;
            new string[128];
            format(string,sizeof(string),"password %s", inputtext);
            SendRconCommand(string);
            strcpy(ServerPassword[playerid],inputtext,128);
            new Dialog[1024];
            format(Dialog, sizeof(Dialog), "You have{FF0000} changed{A9C4E4} the server password to:\n{FF0000} %s{A9C4E4}.", inputtext);
            ShowPlayerDialog(playerid, 268, DIALOG_STYLE_MSGBOX,"Panel", Dialog,"Done", "");
            WantPass[playerid] = 0;
        }
        else
        {
        	new panel[1024];
		    format(panel,sizeof(panel),"Server Name \t\nServer Password\t\nRestart Server \t\nUnBanIP \t\nBanIP \t\nSay \t\nGameModeText \t\nGameModeLanguage \t\nCustom");
		    ShowPlayerDialog(playerid,312,DIALOG_STYLE_LIST,"Panel",panel,"Select","Cancel");
        }
    }
	if(dialogid == 315)
    {
        if(response)
        {
        	WantGMX[playerid] = 1;
			SetTimer("fss",2000,0);
            new Dialog[1024];
            format(Dialog, sizeof(Dialog), "The server will use gmx in 2 seconds.");
            ShowPlayerDialog(playerid, 269, DIALOG_STYLE_MSGBOX,"Panel", Dialog,"Done", "");
            WantGMX[playerid] = 0;
        }
        else
        {
        	new panel[1024];
		    format(panel,sizeof(panel),"Server Name \t\nServer Password\t\nRestart Server \t\nUnBanIP \t\nBanIP \t\nSay \t\nGameModeText \t\nGameModeLanguage \t\nCustom");
		    ShowPlayerDialog(playerid,312,DIALOG_STYLE_LIST,"Panel",panel,"Select","Cancel");
        }
    }
	if(dialogid == 316)
    {
        if(response)
        {
        	new length = strlen(inputtext);
        	if(length==0)
        	{
        	ShowPlayerDialog(playerid, 317,DIALOG_STYLE_INPUT, "Panel", "{FF0000}Please fill this box.\n{A9C4E4}Enter the ip address to unban below:", "Done", "Back");
        	return 1;
        	}        	
        	WantUnBanIP[playerid] = 1;
            new string[128];
            format(string,sizeof(string),"unbanip %s", inputtext);
            SendRconCommand(string);
            strcpy(BanIP[playerid],inputtext,128);
            new Dialog[1024];
            format(Dialog, sizeof(Dialog), "IP %s was unbanned", inputtext);
            ShowPlayerDialog(playerid, 271, DIALOG_STYLE_MSGBOX,"Panel", Dialog,"Done", "");
            WantUnBanIP[playerid] = 0;
        }
        else
        {
        	new panel[1024];
		    format(panel,sizeof(panel),"Server Name \t\nServer Password\t\nRestart Server \t\nUnBanIP \t\nBanIP \t\nSay \t\nGameModeText \t\nGameModeLanguage \t\nCustom");
		    ShowPlayerDialog(playerid,312,DIALOG_STYLE_LIST,"Panel",panel,"Select","Cancel");
        }
    }
	if(dialogid == 317)
    {
        if(response)
        {
        	new length = strlen(inputtext);
        	if(length==0)
        	{
        	ShowPlayerDialog(playerid, 317,DIALOG_STYLE_INPUT, "Panel", "{FF0000}Please fill this box.\n{A9C4E4}Enter the ip address to ban below:", "Done", "Back");
        	return 1;
        	}
        	WantBanIP[playerid] = 1;
            new string[128];
            format(string,sizeof(string),"banip %s", inputtext);
            SendRconCommand(string);
            strcpy(BanIP[playerid],inputtext,128);
            new Dialog[1024];
            format(Dialog, sizeof(Dialog), "IP %s was banned", inputtext);
            ShowPlayerDialog(playerid, 270, DIALOG_STYLE_MSGBOX,"Panel", Dialog,"Done", "");
            WantBanIP[playerid] = 0;
        }
        else
        {
        	new panel[1024];
		    format(panel,sizeof(panel),"Server Name \t\nServer Password\t\nRestart Server \t\nUnBanIP \t\nBanIP \t\nSay \t\nGameModeText \t\nGameModeLanguage \t\nCustom");
		    ShowPlayerDialog(playerid,312,DIALOG_STYLE_LIST,"Panel",panel,"Select","Cancel");
        }
    }
	if(dialogid == 318)
    {
        if(response)
        {
        	new length = strlen(inputtext);
        	if(length==0)
        	{
        	ShowPlayerDialog(playerid, 318,DIALOG_STYLE_INPUT, "Panel", "{FF0000}Please fill this box.\n{A9C4E4}Enter whatever you want to say below:", "Done", "Back");
        	return 1;
        	}
        	WantSay[playerid] = 1;
            new string[128];
            format(string,sizeof(string),"say %s", inputtext);
            SendRconCommand(string);
            strcpy(Say[playerid],inputtext,128);
            new Dialog[1024];
            format(Dialog, sizeof(Dialog), "You {FF0000}said{A9C4E4}:\n{FF0000} %s{A9C4E4}.", inputtext);
            ShowPlayerDialog(playerid, 272, DIALOG_STYLE_MSGBOX,"Panel", Dialog,"Done", "");
            WantSay[playerid] = 0;
        }
        else
        {
            new panel[1024];
		    format(panel,sizeof(panel),"Server Name \t\nServer Password\t\nRestart Server \t\nUnBanIP \t\nBanIP \t\nSay \t\nGameModeText \t\nGameModeLanguage \t\nCustom");
		    ShowPlayerDialog(playerid,312,DIALOG_STYLE_LIST,"Panel",panel,"Select","Cancel");
        }
    }
	if(dialogid == 319)
    {
        if(response)
        {
        	new length = strlen(inputtext);
        	if(length==0)
        	{
        	ShowPlayerDialog(playerid, 319,DIALOG_STYLE_INPUT, "Panel", "{FF0000}Please fill this box.\n{A9C4E4}Enter whatever you want to set gamemodetext below:", "Done", "Back");
        	return 1;
        	}
        	WantGMText[playerid] = 1;
            new string[128];
            format(string,sizeof(string),"gamemodetext %s", inputtext);
            SendRconCommand(string);
            strcpy(Gamemodetext[playerid],inputtext,128);
            new Dialog[1024];
            format(Dialog, sizeof(Dialog), "You have{FF0000} changed{A9C4E4} the gamemode text to:\n{FF0000} %s{A9C4E4}.", inputtext);
            ShowPlayerDialog(playerid, 273, DIALOG_STYLE_MSGBOX,"Panel", Dialog,"Done", "");
            WantGMText[playerid] = 0;
        }
        else
        {
            new panel[1024];
		    format(panel,sizeof(panel),"Server Name \t\nServer Password\t\nRestart Server \t\nUnBanIP \t\nBanIP \t\nSay \t\nGameModeText \t\nGameModeLanguage \t\nCustom");
		    ShowPlayerDialog(playerid,312,DIALOG_STYLE_LIST,"Panel",panel,"Select","Cancel");
        }
    }
	if(dialogid == 320)
    {
        if(response)
        {
        	new length = strlen(inputtext);
        	if(length==0)
        	{
        	ShowPlayerDialog(playerid, 320,DIALOG_STYLE_INPUT, "Panel", "{FF0000}Please fill this box.\n{A9C4E4}Enter whatever you want to set gamemode language below:", "Done", "Back");
        	return 1;
        	}
        	WantLang[playerid] = 1;
            new string[128];
            format(string,sizeof(string),"language %s", inputtext);
            SendRconCommand(string);
            strcpy(Language[playerid],inputtext,128);
            new Dialog[1024];
            format(Dialog, sizeof(Dialog), "You have{FF0000} changed{A9C4E4} the gamemode language to:\n{FF0000} %s{A9C4E4}.", inputtext);
            ShowPlayerDialog(playerid, 274, DIALOG_STYLE_MSGBOX,"Panel", Dialog,"Done", "");
            WantLang[playerid] = 0;
        }
        else
        {
            new panel[1024];
		    format(panel,sizeof(panel),"Server Name \t\nServer Password\t\nRestart Server \t\nUnBanIP \t\nBanIP \t\nSay \t\nGameModeText \t\nGameModeLanguage \t\nCustom");
		    ShowPlayerDialog(playerid,312,DIALOG_STYLE_LIST,"Panel",panel,"Select","Cancel");
        }
    }
	if(dialogid == 321)
    {
        if(response)
        {
        	new length = strlen(inputtext);
        	if(length==0)
        	{
        	ShowPlayerDialog(playerid, 321,DIALOG_STYLE_INPUT, "Panel", "{FF0000}Please fill this box.\n{A9C4E4}Enter whatever you want of RCONs below:", "Done", "Back");
        	return 1;
        	}
        	WantCustom[playerid] = 1;
            new string[128];
            format(string,sizeof(string),"%s", inputtext);
            SendRconCommand(string);
            strcpy(Custom[playerid],inputtext,128);
            new Dialog[1024];
            format(Dialog, sizeof(Dialog), "You have{FF0000} used{A9C4E4}:\n{FF0000} %s{A9C4E4}.", inputtext);
            ShowPlayerDialog(playerid, 279, DIALOG_STYLE_MSGBOX,"Panel", Dialog,"Done", "");
            WantCustom[playerid] = 0;
        }
        else
        {
            new panel[1024];
		    format(panel,sizeof(panel),"Server Name \t\nServer Password\t\nRestart Server \t\nUnBanIP \t\nBanIP \t\nSay \t\nGameModeText \t\nGameModeLanguage \t\nCustom");
		    ShowPlayerDialog(playerid,312,DIALOG_STYLE_LIST,"Panel",panel,"Select","Cancel");
        }
    }
	return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
		 if(strcmp(cmdtext, "/panel", true) == 0)
		{
		// Write your "NEED ADMIN RANK TO DO THIS" script here. I didn't wrote that because I don't know you are using SQL or not.
		new panel[1024];
		format(panel,sizeof(panel),"Server Name \t\nServer Password\t\nRestart Server \t\nUnBanIP \t\nBanIP \t\nSay \t\nGameModeText \t\nGameModeLanguage \t\nCustom");
		ShowPlayerDialog(playerid,312,DIALOG_STYLE_LIST,"Panel",panel,"Select","Cancel");
		return 1;
		}
return 1;
}
forward fss();
public fss()
{
    new string[128];
    format(string,sizeof(string),"gmx");
    SendRconCommand(string);
}