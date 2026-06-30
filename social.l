%{
#include <stdio.h>

int hashtag_count = 0;
int mention_count = 0;
int email_count = 0;
int keyword_count = 0;
int time_count = 0;
int number_count = 0;
int word_count = 0;
int emoji_count = 0;
int date_count = 0;
int phone_count = 0;
int percent_count = 0;
int money_count = 0;
int mood_count = 0;
int location_count = 0;
int reaction_count = 0;

%}

HASHTAG    #[a-zA-Z0-9_]+
MENTION    @[a-zA-Z0-9_]+
EMAIL      [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+
DATE       [0-9]+\/[0-9]+\/[0-9]+
TIME       [0-9]+:[0-9]+(AM|PM)
NUMBER     [0-9]+
KEYWORD    POST|LIKE|COMMENT|SHARE|FOLLOW|TREND
WORD       [a-zA-Z]+
EMOJI      :\)|:-\)|:\(|:-\(|:D|;\)|:P|<3
PHONE      [0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]
PERCENT    [0-9]+%
MONEY      \$[0-9]+
MOOD       HAPPY|SAD|ANGRY|EXCITED|LOVE|FUN
LOCATION   ISLAMABAD|LAHORE|KARACHI|PESHAWAR|MUZAFFARABAD|RAWALPINDI|MANSEHRA
REACTION   LOL|OMG|WOW|ROFL


%%

{HASHTAG} {
    hashtag_count++;
    printf("HASHTAG : %s\n", yytext);
}
{MENTION} {
    mention_count++;
    printf("MENTION : %s\n", yytext);
}
{EMAIL} {
    email_count++;
    printf("EMAIL : %s\n", yytext);
}
{DATE} {
    date_count++;
    printf("DATE : %s\n", yytext);
}
{TIME} {
    time_count++;
    printf("TIME : %s\n", yytext);
}

{NUMBER} {
    number_count++;
    printf("NUMBER : %s\n", yytext);
}
{KEYWORD} {
    keyword_count++;
    printf("KEYWORD : %s\n", yytext);
}
{EMOJI} {
    emoji_count++;
    printf("EMOJI : %s\n", yytext);
}
{MOOD} {
    mood_count++;
    printf("MOOD : %s\n", yytext);
}
{LOCATION} {
    location_count++;
    printf("LOCATION : %s\n", yytext);
}
{REACTION} {
    reaction_count++;
    printf("REACTIONS : %s\n", yytext);
}
{WORD} {
    word_count++;
    printf("WORD : %s\n", yytext);
}
{PHONE} {
    phone_count++;
    printf("PHONE : %s\n", yytext);
}
{PERCENT} {
    percent_count++;
    printf("PERCENT : %s\n", yytext);
}
{MONEY} {
    money_count++;
    printf("MONEY : %s\n", yytext);
}


[ \t\n]+ ;

. { printf("UNKNOWN : %s\n", yytext); }

%%

int yywrap()
{
    return 1;
}
int main()
{
    yylex();

    printf("\n===== SUMMARY =====\n");
    printf("Keywords : %d\n", keyword_count);
    printf("Mentions : %d\n", mention_count);
    printf("Emails   : %d\n", email_count);
    printf("Dates    : %d\n", date_count);
    printf("Hashtags : %d\n", hashtag_count);
    printf("Times    : %d\n", time_count);
    printf("Numbers  : %d\n", number_count);
    printf("Moods    : %d\n", mood_count);
    printf("Locations: %d\n", location_count);
    printf("Reactions    : %d\n", reaction_count);
    printf("Words    : %d\n", word_count);
    printf("Emojis   : %d\n", emoji_count);
    printf("Phone Numbers   : %d\n", phone_count);
    printf("Percent  : %d\n", percent_count);
    printf("Money  : %d\n", money_count);
    



    return 0;
}