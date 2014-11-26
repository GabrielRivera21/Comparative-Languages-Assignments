/**
 * rock_paper_scissors.c
 * @author Gabriel Rivera Per-ossenkopp
 * Student Number: 841-11-6930
 * September 24, 2014
 * Description: This program executes a rock-paper-scissors game
 * and tells you the percentage of your wins.
 */

 #include <time.h>
 #include <stdio.h>
 #include <stdlib.h> //for srand, rand
 #include <ctype.h>  //for toupper
 #include <stdbool.h> //for bool, true or false
 #define LENGTH 3

 //prototypes
 bool continue_playing();
 void selection(int *selected_hand, int *pc_hand);
 bool won(float *win, float *played_games, int selected_hand, int pc_hand);
 bool draw(int player_hand, int pc_hand);


int main(void){
    char *hand[LENGTH] = {"rock", "paper", "scissors"};
    int player_hand;
    int pc_hand;
    float wins = 0;
    float played_games = 0;
    srand(time(NULL));

    do{
        selection(&player_hand, &pc_hand);
        printf("Your hand is %d = %s. PC's hand is %s. %s!\n",
          player_hand, hand[player_hand], hand[pc_hand],
          draw(player_hand, pc_hand)? "It's a Draw" : won(&wins, &played_games, player_hand, pc_hand)? "You Win" : " You Lose");
    }while(continue_playing());

    printf("You won %.0f times\n", wins);
    printf("You played %.0f games\n", played_games);
    printf("Thanks for playing. You won %.1f%% of the games\n", (wins/played_games) * 100);

    return 0;
}

/**
 * Gets the selection of the player's hand and the PC's hand.
 */
void selection(int *selected_hand, int *pc_hand){
    printf("Enter your selection (0=Rock, 1=Paper, 2=Scissors): ");
    scanf("%d", selected_hand);
    while(getchar() != '\n'); //flush keyboard buffer
    *pc_hand = rand() % 3; //picks a random number from 0-2 for the PC
}

/**
 * Returns true if its a draw, false if it's not.
 */
bool draw(int player_hand, int pc_hand){
    return player_hand == pc_hand;
}

/**
 * returns true if the player won the rock-paper-scissors game
 * and increments the number of games played.
 */
bool won(float *wins, float *played_games, int player_hand, int pc_hand){
    *played_games += 1;
    if(player_hand == 0){ //player = rock
        if(pc_hand == 2){ //PC = scissors
            *wins += 1;
            return true;
        }else
            return false; //PC = paper
    }else if(player_hand == 1){ //player = paper
        if(pc_hand == 0){ //PC = rock
            *wins += 1;
            return true;
        }else
            return false; //PC = scissors
    } else {              //Player = Scissors
        if(pc_hand == 1){ //PC = Paper
            *wins += 1;
            return true;
        }else
            return false; //PC = Rock
    }
}

/**
 * Gets the player input if he will continue playing
 */
bool continue_playing(){
    char decision;

    do {
        printf("Do you wish to continue playing? (Y/N) ");
        scanf("%c", &decision);
        printf("\n");
        while (getchar() != '\n'); // flush keyboard buffer
    }while(toupper(decision) != 'Y' && toupper(decision) != 'N');

    return toupper(decision) == 'Y';
}






