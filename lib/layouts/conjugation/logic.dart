// import { vowels, letters } from "./alphabet";

// createInfinitive = (root, binyan) => {

//     switch(binyan) {
//         case 'Paal':
//             if(root[0] === letters.alef) // leehov
//                 return {
//                     'inf': 'ל' + vowels.E + root[0] + vowels.E + root[1] + 'וֹ' + root[2]
//                 }
//             else if(root[1] === letters.yod || root[1] === letters.vav) // lakum
//                 return {
//                     'inf': 'ל' + vowels.A + root[0] + root[1] + root[2]
//                 }
//             else
//                 return {
//                     'inf': 'ל' + vowels.i + root[0] + root[1] + 'וֹ' + root[2]
//                 }
//         case 'Piel':
//             return {
//                 'inf': 'ל' + vowels.e + root[0] + vowels.a + root[1] + vowels.e + root[2]
//             }
//         case 'Hiphil':
//             return {
//                 'inf': 'לה' + vowels.a + root[0] + vowels.a + root[1] + vowels.i + 'י' + root[2]
//             }
//         case 'Hitpael': 
//             return {
//                 'inf': 'לה' + vowels.i + 'ת' + root[0] + vowels.a + root[1] + vowels.e + root[2]
//             }
//         case 'Nifal':
//             return {
//                 'inf': 'לְהִ' + root[0] + vowels.A + root[1] + vowels.e + root[2]
//             }
//         case 'Pual':
//             return {
//                 'inf': 'מְ' + root[0] + vowels.u + root[1] + vowels.A + root[2]
//             }
//         case 'Hufal':
//             return {
//                 'inf': 'מוּ' + root[0] + vowels._e + root[1] + vowels.A + root[2]
//             }
//         default:
//             return {
//                 'inf': root
//             }
//     }
// }

// export const conjugatePresent = (root, binyan) => {

//     switch(binyan) {
//         case 'Paal':
//             if(root[1] === letters.yod || root[1] === letters.vav)
//                 return {
//                     'S M': root[0] + vowels.A + root[2],
//                     'S F': root[0] + vowels.A + root[2] + vowels.A + 'ה',
//                     'P M': root[0] + vowels.A + root[2] + vowels.i + 'י' + 'ם',
//                     'P F': root[0] + vowels.A + root[2] + 'וֹ' + 'ת'
//                 } 
//             else
//                 return {
//                     'S M': root[0] + 'וֹ' + root[1] + vowels.e + root[2], //e
//                     'S F': root[0] + 'וֹ' + root[1] + vowels.E + root[2] + vowels.E + 'ת',
//                     'P M': root[0] + 'וֹ' + root[1] + vowels._e +  root[2] + vowels.i + 'י' + 'ם',
//                     'P F': root[0] + 'וֹ' + root[1] + vowels._e + root[2] + 'וֹ' + 'ת'
//                 } // divide in 3, check root length maybe?
//         case 'Piel':
//             return {
//                 'S M': 'מְ' + root[0] + vowels.a + root[1] + vowels.e + root[2], //ae
//                 'S F': 'מְ' + root[0] + vowels.a + root[1] + vowels.E + root[2] + vowels.E + 'ת',
//                 'P M': 'מְ' + root[0] + vowels.a + root[1] + vowels._e + root[2] + vowels.i + 'י' + 'ם',
//                 'P F': 'מְ' + root[0] + vowels.a + root[1] + vowels._e + root[2] + 'וֹ' + 'ת'
//             }
//         case 'Hiphil':
//             return {
//                 'S M': 'מַ' + root[0] + vowels._e + root[1] + vowels.i + 'י' + root[2], // i
//                 'S F': 'מַ' + root[0] + vowels._e + root[1] + vowels.i + 'י' + root[2] + vowels.A + 'ה',
//                 'P M': 'מַ' + root[0] + vowels._e + root[1] + vowels.i + 'י' + root[2] + vowels.i + 'י' + 'ם',
//                 'P F': 'מַ' + root[0] + vowels._e + root[1] + vowels.i + 'י' + root[2] + 'וֹ' + 'ת'
//             }
//         case 'Hitpael': 
//             return {
//                 'S M': 'מ' + vowels.i + 'ת' + vowels._e + root[0] + vowels.a + root[1] + vowels.e + root[2], //ae
//                 'S F': 'מ' + vowels.i + 'ת' + vowels._e + root[0] + vowels.a + root[1] + vowels.E + root[2]+ vowels.E + 'ת',
//                 'P M': 'מ' + vowels.i + 'ת' + vowels._e + root[0] + vowels.a + root[1] + vowels._e + root[2] + vowels.i + 'י' + 'ם',
//                 'P F': 'מ' + vowels.i + 'ת' + vowels._e + root[0] + vowels.a + root[1] + vowels._e + root[2] + 'וֹ' + 'ת'
//             }
//         case 'Nifal':
//             return {
//                 'S M': 'נִ' + root[0] + root[1] + vowels.A + root[2],
//                 'S F': 'נִ' + root[0] + root[1] + vowels.E + root[2] + vowels.E + 'ת',
//                 'P M': 'נִ' + root[0] + root[1] + vowels.A + root[2] + vowels.i + 'י' + 'ם',
//                 'P F': 'נִ' + root[0] + root[1] + vowels.A + root[2] + 'וֹ' + 'ת'
//             }
//         case 'Pual':
//             return {
//                 'S M': 'מְ' + root[0] + vowels.u + root[1] + vowels.A + root[2], 
//                 'S F': 'מְ' + root[0] + vowels.u + root[1] + vowels.E + root[2] + vowels.E + 'ת',
//                 'P M': 'מְ' + root[0] + vowels.u + root[1] + vowels.A + root[2] + vowels.i + 'י' + 'ם',
//                 'P F': 'מְ' + root[0] + vowels.u + root[1] + vowels.A + root[2] + 'וֹ' + 'ת'
//             }
//         case 'Hufal':
//             return {
//                 'S M': 'מוּ' + root[0] + vowels._e + root[1] + vowels.A + root[2],
//                 'S F': 'מוּ' + root[0] + vowels._e + root[1] + vowels.A + root[2] + vowels.E +  'ת',
//                 'P M': 'מוּ' + root[0] + vowels._e + root[1] + vowels.A + root[2] + vowels.i + 'י' + 'ם',
//                 'P F': 'מוּ' + root[0] + vowels._e + root[1] + vowels.A + root[2] + 'וֹ' + 'ת'
//             }
//         default:
//           return {'root': root};
//       }
// }

// export const conjugatePast = (root, binyan) => {
    
//     switch (binyan) {
//         case 'Paal':
//             if(root[1] === letters.yod || root[1] === letters.vav)
//                 return {
//                     'I': root[0] + vowels.A + root[2] + vowels._e + 'ת'+ vowels.i + 'י',
//                     'You F': root[0] + vowels.A + root[2] + vowels._e + 'ת',
//                     'You M': root[0] + vowels.A + root[2] + vowels._e + 'ת' + vowels.A,
//                     'He': root[0] + vowels.A + root[2],
//                     'She': root[0] + vowels.A + root[2] + vowels.A + 'ה',
//                     'We': root[0] + vowels.A + root[2] + vowels._e + 'נ' + 'וּ',
//                     'You M P': root[0] + vowels.A + root[2] + vowels._e + 'ת' + vowels.E + 'ם',
//                     'You F P': root[0] + vowels.A + root[2] + vowels._e + 'ת' + vowels.E + 'ן',
//                     'They': root[0] + vowels.A + root[2] + 'וּ'
//                 }
//             else
//                 return {
//                     'I': root[0] + vowels.A + root[1] + vowels.a + root[2] + vowels._e + 'ת'+ vowels.i + 'י',
//                     'You F': root[0] + vowels.A + root[1] + vowels.a + root[2] + vowels._e + 'ת',
//                     'You M': root[0] + vowels.A + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.A,
//                     'He': root[0] + vowels.A + root[1] + vowels.a + root[2],
//                     'She': root[0] + vowels.A + root[1] + vowels._e + root[2] + vowels.A + 'ה',
//                     'We': root[0] + vowels.A + root[1] + vowels.a + root[2] + vowels._e + 'נ' + 'וּ',
//                     'You M P': root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ם',
//                     'You F P': root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ן',
//                     'They': root[0] + vowels.A + root[1] + vowels._e + root[2] + 'וּ'
//                 }
//         case 'Piel':
//             return {
//                 'I': root[0] + vowels.i + 'י' + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.i + 'י',
//                 'You F': root[0] + vowels.i + 'י' + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels._e,
//                 'You M': root[0] + vowels.i + 'י' + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.A,
//                 'He': root[0] + vowels.i + 'י' + root[1] + vowels.e + root[2],
//                 'She': root[0] + vowels.i + 'י' + root[1] + vowels._e + root[2] + vowels.A + 'ה',
//                 'We': root[0] + vowels.i + 'י' + root[1] + vowels.a + root[2] + vowels._e + 'נ' + 'וּ',
//                 'You M P': root[0] + vowels.i + 'י' + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ם',
//                 'You F P': root[0] + vowels.i + 'י' + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ן',
//                 'They': root[0] + vowels.i + 'י' + root[1] + vowels._e + root[2] + 'וּ'
//             }
//         case 'Hiphil':
//             return {
//                 'I': 'הִ' + root[0] + vowels._e + root[1] + vowels.e + root[2] + 'ת' + vowels.i + 'י',
//                 'You F': 'הִ' + root[0] + vowels._e + root[1] + vowels.e + root[2] + 'ת',
//                 'You M': 'הִ' + root[0] + vowels._e + root[1] + vowels.e + root[2] + 'ת' + vowels.A + 'ה',
//                 'He': 'הִ' + root[0] + vowels._e + root[1] + vowels.i + 'י' + root[2],
//                 'She': 'הִ' + root[0] + vowels._e + root[1] + vowels.i + 'י' + root[2] + vowels.A + 'ה',
//                 'We': 'הִ' + root[0] + vowels._e + root[1] + vowels.e + root[2] + 'נ' + 'וּ',
//                 'You M P': 'הִ' + root[0] + vowels._e + root[1] + vowels.e + root[2] + 'ת' + vowels.E + 'ם',
//                 'You F P': 'הִ' + root[0] + vowels._e + root[1] + vowels.e + root[2] + 'ת' + vowels.E + 'ן',
//                 'They': 'הִ' + root[0] + vowels._e + root[1] + vowels.i + 'י' + root[2] + 'וּ' 

//             }
//         case 'Hitpael':
//             return {
//                 'I': 'הִת' + root[0] + vowels.a + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.i + 'י',
//                 'You F': 'הִת' + root[0] + vowels.a +root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels._e,
//                 'You M': 'הִת' + root[0] + vowels.a + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.A,
//                 'He': 'הִת' + root[0] + vowels.a +  root[1] + vowels.e + root[2],
//                 'She': 'הִת' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels.A + 'ה',
//                 'We': 'הִת' + root[0] + vowels.a + root[1] + vowels.a + root[2] + vowels._e + 'נ' + 'וּ',
//                 'You M P': 'הִת' + root[0] + vowels.a + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ם',
//                 'You F P': 'הִת' + root[0] + vowels.a + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ן',
//                 'They': 'הִת' + root[0] + vowels.a + root[1] + vowels._e + root[2] + 'וּ'
//             }
//         case 'Nifal':
//             return {
//                 'I': 'נִ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'ת'+ vowels.i + 'י',
//                 'You F': 'נִ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels._e,
//                 'You M': 'נִ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.A,
//                 'He': 'נִ' + root[0] + vowels._e + root[1] + vowels.a + root[2],
//                 'She': 'נִ' + root[0] + vowels._e + root[1] + vowels._e + root[2] + vowels.A + 'ה',
//                 'We': 'נִ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'נ' + 'וּ',
//                 'You M P': 'נִ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ם',
//                 'You F P': 'נִ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ן',
//                 'They': 'נִ' + root[0] + vowels._e + root[1] + vowels._e + root[2] + 'וּ'
//             }
//         case 'Pual':
//             return {
//                 'I': root[0] + vowels.u + root[1] + vowels.a + root[2] + vowels._e + 'ת'+ vowels.i + 'י',
//                 'You F': root[0] + vowels.u + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels._e,
//                 'You M': root[0] + vowels.u + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.A,
//                 'He': root[0] + vowels.u + root[1] + vowels.a + root[2],
//                 'She': root[0] + vowels.u + root[1] + root[2] + vowels.A + 'ה',
//                 'We': root[0] + vowels.u + root[1] + vowels.a + root[2] + vowels._e + 'נ' + 'וּ',
//                 'You M P': root[0] + vowels.u + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ם',
//                 'You F P': root[0] + vowels.u + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ן',
//                 'They': root[0] + vowels.u + root[1] + vowels._e + root[2] + 'וּ'
//             }
//         case 'Hufal':
//             return {
//                 'I': 'הֻ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + 'ת'+ vowels.i + 'י',
//                 'You F': 'הֻ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels._e,
//                 'You M': 'הֻ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.A,
//                 'He': 'הֻ' + root[0] + vowels._e + root[1] + vowels.a + root[2],
//                 'She': 'הֻ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels.A + 'ה',
//                 'We': 'הֻ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'נ' + 'וּ',
//                 'You M P': 'הֻ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ם',
//                 'You F P': 'הֻ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + vowels._e + 'ת' + vowels.E + 'ן',
//                 'They': 'הֻ' + root[0] + vowels._e + root[1] + vowels.a + root[2] + 'וּ'
//             }
//         default:
//             return {'root': root};
//     }
// }

// export const conjugateFuture = (root, binyan) => {

//     switch(binyan) {
//         case 'Paal':
//             if(root[1] === letters.vav)
//                 return {
//                     'I': 'אָ' + root[0] + 'וּ' + root[2],
//                     'We': 'נָ' + root[0] + 'וּ' + root[2],
//                     'You M': 'תָּ' + root[0] + 'וּ' + root[2],
//                     'You F': 'תָּ' + root[0] + 'וּ' + root[2] + 'י',
//                     'You': 'תָּ' + root[0] + 'וּ' + root[2] + 'וּ',
//                     'He': 'יָ' + root[0] + 'וּ' + root[2],
//                     'She': 'תָּ' + root[0] + 'וּ' + root[2],
//                     'They': 'יָ' + root[0] + 'וּ' + root[2] + 'וּ'
//                 }
//             else if(root[1] === letters.yod)
//                 return {
//                     'I': 'אָ' + root[0] + vowels.i + root[1] + root[2],
//                     'We': 'נָ' + root[0] + vowels.i + root[1] + root[2],
//                     'You M': 'תָּ' + root[0] + vowels.i + root[1] + root[2],
//                     'You F': 'תָּ' + root[0] + vowels.i + root[1] + root[2] + 'י',
//                     'You': 'תָּ' + root[0] + vowels.i + root[1] + root[2] + 'וּ',
//                     'He': 'יָ' + root[0] + vowels.i + root[1] + root[2],
//                     'She': 'תָּ' + root[0] + vowels.i + root[1] + root[2],
//                     'They': 'יָ' + root[0] + vowels.i + root[1] + root[2] + 'וּ'
//                 }
//             else
//                 return {
//                     'I': 'אֶ' + root[0] + vowels._e + root[1] + 'וֹ' + root[2],
//                     'We': 'נִ' + root[0] + vowels._e + root[1] + 'וֹ' + root[2],
//                     'You M': 'תִּ' + root[0] + vowels._e + root[1] + 'וֹ' + root[2],
//                     'You F': 'תִּ' + root[0] + vowels._e + root[1] + 'וֹ' + root[2] + 'י',
//                     'You': 'תִּ' + root[0] + vowels._e + root[1] + 'וֹ' + root[2] + 'וּ',
//                     'He': 'יִ' + root[0] + vowels._e + root[1] + 'וֹ' + root[2],
//                     'She': 'תִּ' + root[0] + vowels._e + root[1] + 'וֹ' + root[2],
//                     'They': 'יִ' + root[0] + vowels._e + root[1] + vowels._e + root[2] + 'וּ'
//                 }
//         case 'Piel':
//             return {
//                 'I': 'אֲ' + root[0] + vowels.a + root[1] + vowels.e + root[2],
//                 'We': 'נְ' + root[0] + vowels.a + root[1] + vowels.e + root[2],
//                 'You M': 'תְּ' + root[0] + vowels.a + root[1] + vowels.e + root[2],
//                 'You F': 'תְּ' + root[0] + vowels.a + root[1] + root[2] + 'י',
//                 'You': 'תְּ' + root[0] + vowels.a + root[1] + root[2] + 'וּ',
//                 'He': 'יְ' + root[0] + vowels.a + root[1] + vowels.e + root[2],
//                 'She': 'תְּ' + root[0] + vowels.a + root[1] + vowels.e + root[2],
//                 'They': 'יְ' + root[0] + vowels.a + root[1] + root[2] + 'וּ'
//             }
//         case 'Hiphil':
//             return {
//                 'I': 'אַ' + root[0] + root[1] + vowels.i + 'י' + root[2],
//                 'We': 'נַ' + root[0] + root[1] + vowels.i + 'י' + root[2],
//                 'You M': 'תַּ' + root[0] + root[1] + vowels.i + 'י' + root[2],
//                 'You F': 'תַּ' + root[0] + root[1] + vowels.i + 'י' + root[2] + vowels.i + 'י',
//                 'You': 'תַּ' + root[0] + root[1] + vowels.i + 'י' + root[2] + 'וּ',
//                 'He': 'יַ' + root[0] + root[1] + vowels.i + 'י' + root[2],
//                 'She': 'תַּ' + root[0] + root[1] + vowels.i + 'י' + root[2],
//                 'They': 'יַ' + root[0] + root[1] + vowels.i + 'י' + root[2] + 'וּ'
//             }
//         case 'Hitpael':
//             return {
//                 'I': 'אֶתְ' + root[0] + vowels.a + root[1] + vowels.e + root[2],
//                 'We': 'נִתְ' + root[0] + vowels.a + root[1] + vowels.e + root[2],
//                 'You M': 'תִּתְ' + root[0] + vowels.a + root[1] + vowels.e + root[2],
//                 'You F': 'תִּתְ' + root[0] + vowels.a + root[1] + root[2] + vowels.i + 'י',
//                 'You': 'תִּתְ' + root[0] + vowels.a + root[1] + root[2] + 'וּ',
//                 'He': 'יִתְ' + root[0] + vowels.a + root[1] + vowels.e + root[2],
//                 'She': 'תִּתְ' + root[0] + vowels.a + root[1] + vowels.e + root[2],
//                 'They': 'יִתְ' + root[0] + vowels.a + root[1] + root[2] + 'וּ'
//             }
//         case 'Nifal':
//             return {
//                 'I': 'אֶ' + root[0] + vowels.A + root[1] + vowels.e + root[2],
//                 'We': 'נִ' + root[0] + vowels.A + root[1] + vowels.e + root[2],
//                 'You F': 'תִּ' + root[0] + vowels.A + root[1] + vowels._e + root[2] + vowels.i + 'י',
//                 'You M': 'תִּ' + root[0] + vowels.A + root[1] + vowels.e + root[2],
//                 'You': 'תִּ' + root[0] + vowels.A + root[1] + vowels._e + root[2] + 'וּ',
//                 'He': 'יִ' + root[0] + vowels.A + root[1] + vowels.e + root[2],
//                 'She': 'תִּ' + root[0] + vowels.A + root[1] + vowels.e + root[2],
//                 'They': 'יִ' + root[0] + vowels.A + root[1] + vowels.e + root[2] + 'וּ'
//             }
//         case 'Pual':
//             return {
//                 'I': 'אֲ' + root[0] + vowels.u + root[1] + vowels.A + root[2],
//                 'We': 'נְ' + root[0] + vowels.u + root[1] + vowels.A + root[2],
//                 'You F': 'תְּ' + root[0] + vowels.u + root[1] + vowels._e + root[2] + vowels.i + 'י',
//                 'You M': 'תְּ' + root[0] + vowels.u + root[1] + vowels.A + root[2],
//                 'You': 'תְּ' + root[0] + vowels.u + root[1] + vowels._e + root[2] + 'וּ',
//                 'He': 'יְ' + root[0] + vowels.u + root[1] + vowels.A + root[2],
//                 'She': 'תְּ' + root[0] + vowels.u + root[1] + vowels.A + root[2],
//                 'They': 'יְ' + root[0] + vowels.u + root[1] + vowels._e + root[2] + 'וּ'
//             }
//         case 'Hufal':
//             return {
//                 'I': 'אֻ' + root[0] + vowels._e + root[1] + vowels.A + root[2],
//                 'We': 'נֻ' + root[0] + vowels._e + root[1] + vowels.A + root[2],
//                 'You F': 'תֻּ' + root[0] + vowels._e + root[1] + vowels._e + root[2] + vowels.i + 'י',
//                 'You M': 'תֻּ' + root[0] + vowels._e + root[1] + vowels.A + root[2],
//                 'You': 'תֻּ' + root[0] + vowels._e + root[1] + vowels._e + root[2] + 'וּ',
//                 'He': 'יֻ' + root[0] + vowels._e + root[1] + vowels.A + root[2],
//                 'She': 'תֻּ' + root[0] + vowels._e + root[1] + vowels.A + root[2],
//                 'They': 'יֻ' + root[0] + vowels._e + root[1] + vowels._e + root[2] + 'וּ'
//             }
//         default:
//             return {'root': root};
//     }
// }