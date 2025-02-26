part of 'add_tryst_cubit.dart';

final class AddTrystState extends Equatable
{
    const AddTrystState({required this.newTrstEncounter});
    final TrystData newTrstEncounter;
    @override
    List<Object?> get props => [newTrstEncounter];
    AddTrystState copyWith({TrystData? newTrstEncounter})
    {
        return AddTrystState(
            newTrstEncounter: newTrstEncounter ?? this.newTrstEncounter);
    }
}
final class Participant extends Equatable
{
    const Participant(
    {required this.name,
        required this.physicalGender,
        this.currentKnownPartners = 1,
        this.knownSTIs,
        this.trysInteractionData});
    final String name;
    final PhysicalGender physicalGender;
    final int currentKnownPartners;
    final List<SexuallyTransimittedInfections>? knownSTIs;
    final ParticipantTrystData? trysInteractionData;
    @override
    List<Object?> get props => [
        name,
        physicalGender,
        knownSTIs,
        trysInteractionData,
        currentKnownPartners
    ];
    Participant copyWith(
    {ParticipantTrystData? trysInteractionData,
        String? name,
        int? currentKnownPartners,
        List<SexuallyTransimittedInfections>? knownSTIs,
        PhysicalGender? physicalGender})
    {
        return Participant(
            name: name ?? this.name,
            physicalGender: physicalGender ?? this.physicalGender,
            currentKnownPartners: currentKnownPartners ?? this.currentKnownPartners,
            knownSTIs: knownSTIs ?? this.knownSTIs,
            trysInteractionData: trysInteractionData ?? this.trysInteractionData);
    }
}
final class UserInformation extends Equatable
{
    const UserInformation({this.sexualActivity, this.participationData});
    final List<TrystData>? sexualActivity;
    final Participant? participationData;
    @override
    List<Object?> get props => [
        sexualActivity,
        participationData
    ];
    UserInformation copyWith({List<TrystData>? sexualActivity, Participant? participationData})
    {
        return UserInformation(
            sexualActivity: sexualActivity ?? this.sexualActivity,
            participationData: participationData ?? this.participationData
        );
    }
}
final class TrystData extends Equatable
{
    final List<BaseSexPositions>? generalPositions;
    final List<SingleFemaleExtendedPositions>? multiMalePositons;
    final List<SingleMaleExtendedPositions>? multiFemalPositions;
    final UserInformation? userInformation;
    final List<Participant>? participants;
    final TrystDurations? trystDurations;
    const TrystData(
    {this.generalPositions,
        this.multiMalePositons,
        this.multiFemalPositions,
        this.userInformation,
        this.participants,
        this.trystDurations});
    @override
  List<Object?> get props => [generalPositions, multiFemalPositions, userInformation, participants, trystDurations];
}

final class ParticipantTrystData extends Equatable
{
    const ParticipantTrystData(
    {this.protectionUsed,
        this.orificesPenetrated,
        this.tongueContacts,
        this.orificesPenetratedWithObject});
    final List<Protection>? protectionUsed;
    final List<SexualVectors>? orificesPenetrated;
    final List<SexualVectors>? tongueContacts;
    final List<SexualVectors>? orificesPenetratedWithObject;
    @override
    List<Object?> get props => [
        protectionUsed,
        orificesPenetrated,
        tongueContacts,
        orificesPenetratedWithObject
    ];
    ParticipantTrystData copyWith(
    {List<Protection>? protectionUsed,
        List<SexualVectors>? orificesPenetrated,
        List<SexualVectors>? tongueContacts,
        List<SexualVectors>? orificesPenetratedWithObject})
    {
        return ParticipantTrystData(
            protectionUsed: protectionUsed ?? this.protectionUsed,
            orificesPenetrated: orificesPenetrated ?? this.orificesPenetrated,
            tongueContacts: tongueContacts ?? this.tongueContacts,
            orificesPenetratedWithObject:
            orificesPenetratedWithObject ?? this.orificesPenetratedWithObject);
    }
}
class TrystDurations
{
    final int? foreplay;
    final int? vaginal;
    final int? anal;
    final int? multi;
    const TrystDurations({this.foreplay, this.vaginal, this.anal, this.multi});
}
enum BaseSexPositions
{
    missionary,
    sixtyNine,
    riding,
    doggie;
    String get anal => '${name.toString()} anal insertion';
}
enum SingleFemaleExtendedPositions
{
    oralOverload,
    doggieBlowjob,
    doublePenetration,
    totalPenetration;
    String get anal => '${name.toString()} anal penetration';
}
enum SingleMaleExtendedPositions
{
    doubleRiding,
    deluxeSixtyNine;
    String get anal => '${name.toString()} anal penetration';
}
enum PhysicalGender
{
    male, female
}
enum SexuallyTransimittedInfections
{
    chlamydia,
    gonorrhea,
    syphilis,
    trichomoniasis,
    herpes,
    papillomavirus,
    hiv
}
enum Protection
{
    condom, pullOut, vasectomy, iud, hormonal, spermicide
}
enum SexualVectors
{
    oral, anal, vaginal, penis
}
